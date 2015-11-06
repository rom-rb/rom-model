

describe "Chaning validations into a commad" do
  include_context "database"

  subject(:validator) { user_validator.new(attributes) }

  let(:user_attrs) do
    Class.new {
      include ROM::Model::Attributes

      set_model_name 'User'

      attribute :name, String
      attribute :email, String
      attribute :birthday, Date
    }
  end

  let(:user_validator) do
    Class.new {
      include ROM::Model::Validator

      relation :users

      validates :name, presence: true, uniqueness: { message: 'TAKEN!' }
      validates :email, uniqueness: true

      def self.name
        'User'
      end
    }
  end

  before { ROM.finalize }


  it "works" do
    expect { rom.command(:users).create.call(name: "John", email: "john@doe.org") }.to change(rom.relation(:users), :count).by 1
  end

  it "runs validations" do
    validated_command = (user_validator >> rom.command(:users).create)
    expect { 
      validated_command.call({})
    }.to raise_error(ROM::Model::ValidationError)
  end

  it "calls the nested command when validations pass" do
    validated_command = (user_validator >> rom.command(:users).create)
    attributes = user_attrs.new(name: "John", email: "john@doe.org")
    expect { 
      validated_command.call(attributes)
    }.to change(rom.relation(:users), :count).by 1

  end



end
