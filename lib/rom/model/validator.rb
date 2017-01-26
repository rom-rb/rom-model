require 'dry-equalizer'
require 'charlatan'
require 'dry/core/class_attributes'

require 'rom/constants'

require 'rom/model/validator/uniqueness_validator'

require 'rom/pipeline'

module ROM
  module Model
    class ValidationError < CommandError
      include Charlatan.new(:errors)
      include Dry::Equalizer(:errors)
    end

    class Composite < Pipeline::Composite
      def call(attributes)
        left.call(attributes)

        right.call(attributes)
      end
    end

    # Mixin for ROM-compliant validator objects
    #
    # @example
    #
    #
    #   class UserAttributes
    #     include ROM::Model::Attributes
    #
    #     attribute :name
    #
    #     validates :name, presence: true
    #   end
    #
    #   class UserValidator
    #     include ROM::Model::Validator
    #   end
    #
    #   attrs = UserAttributes.new(name: '')
    #   UserValidator.call(attrs) # raises ValidationError
    #
    # @api public
    module Validator
      # Inclusion hook that extends a class with required interfaces
      #
      # @api private
      def self.included(base)
        base.class_eval do
          extend ClassMethods
          extend Dry::Core::ClassAttributes

          include ActiveModel::Validations
          include Dry::Equalizer(:attributes, :errors)

          base.defines :embedded_validators

          embedded_validators({})
        end
      end

      # @return [Model::Attributes]
      #
      # @api private
      attr_reader :attributes

      # @api private
      attr_reader :attr_names

      # @attr_reader [Object] root The root node in attributes hash of an embedded validator
      #
      # @api public
      attr_reader :root

      # @attr_reader [Object] root The parent node in attributes hash of an embedded validator
      #
      # @api public
      attr_reader :parent

      delegate :model_name, to: :attributes

      # @api private
      def initialize(attributes, root = attributes, parent = nil)
        @attributes = attributes
        @root = root
        @parent = parent
        @attr_names = self.class.validators.map(&:attributes).flatten.uniq
      end

      # @return [Model::Attributes]
      #
      # @api public
      def to_model
        attributes
      end

      # Trigger validations and return attributes on success
      #
      # @raises ValidationError
      #
      # @return [Model::Attributes]
      #
      # @api public
      def call
        raise ValidationError, errors unless valid?
        attributes
      end


      private

      # This is needed for ActiveModel::Validations to work properly
      # as it expects the object to provide attribute values. Meh.
      #
      # @api private
      def method_missing(name, *args, &block)
        if attr_names.include?(name)
          attributes[name]
        else
          super
        end
      end

      module ClassMethods
        # Set relation name for a validator
        #
        # This is needed for validators that require database access
        #
        # @example
        #
        #   class UserValidator
        #     include ROM::Model::Validator
        #
        #     relation :users
        #
        #     validates :name, uniqueness: true
        #   end
        #
        # @return [Symbol]
        #
        # @api public
        def relation(name = nil)
          @relation = name if name
          @relation
        end

        # @api private
        def set_model_name(name)
          class_eval <<-RUBY
            def self.model_name
              @model_name ||= ActiveModel::Name.new(self, nil, #{name.inspect})
            end
          RUBY
        end

        # Trigger validation for specific attributes
        #
        # @param [Model::Attributes] attributes The attributes for validation
        #
        # @raises [ValidationError]
        #
        # @return [Model::Attributes]
        def call(attributes)
          validator = new(attributes)
          validator.call
        end

        # Compose a validation with a command
        #
        # The command will be called if validations succeed
        #
        # @example
        #   validated_command = (UserValidator >> users.create)
        #   validated_command.call(attributes)
        #
        # @return [Composite]
        #
        # @api public
        def >>(other)
          Composite.new(self, other)
        end

        # Specify an embedded validator for nested structures
        #
        # @example
        #   class UserValidator
        #     include ROM::Model::Validator
        #
        #     set_model_name 'User'
        #
        #     embedded :address do
        #       validates :city, :street, :zipcode, presence: true
        #     end
        #
        #     emebdded :tasks do
        #       validates :title, presence: true
        #     end
        #   end
        #
        #   validator = UserAttributes.new(address: {}, tasks: {})
        #
        #   validator.valid? # false
        #   validator.errors[:address].first # errors for address
        #   validator.errors[:tasks] # errors for tasks
        #
        # @api public
        def embedded(name, options = {}, &block)
          presence = options.fetch(:presence, true)

          validator_class = Class.new {
            include ROM::Model::Validator
          }

          validator_class.set_model_name(name.to_s.classify)
          validator_class.class_eval(&block)

          embedded_validators[name] = validator_class

          validates name, presence: true if presence

          validate do
            value = attributes[name]

            if value.present?
              Array([value]).flatten.each do |object|
                validator = validator_class.new(object, root, attributes)
                validator.validate

                if validator.errors.any?
                  errors.add(name, validator.errors)
                else
                  errors.add(name, [])
                end
              end
            end
          end
        end
      end
    end
  end
end
