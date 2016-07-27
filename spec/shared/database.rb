shared_context 'database' do
  let(:rom) { ROM.env = ROM.container(configuration) }
  let(:configuration) { ROM::Configuration.new(:sql, DB_URI) }
  let(:uri) { DB_URI }
  let(:conn) { Sequel.connect(uri) }

  def drop_tables
    [:users].each do |name|
      conn.drop_table?(name)
    end
  end

  before do
    drop_tables

    conn.create_table :users do
      primary_key :id
      column :name, String, null: false
      column :email, String, null: false
      column :birthday, Date
      index :name, unique: true
      check { char_length(name) > 2 }
    end

    configuration.relation(:users)

    configuration.commands(:users) do
      define(:create)
    end
  end

  after do
    conn.disconnect
  end
end
