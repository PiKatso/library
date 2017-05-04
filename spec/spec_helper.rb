require "library"
require "rspec"
require "pry"
require "pg"

DB = PG.connect({:dbname => 'test_library'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM book *;")
    DB.exec("DELETE FROM author *;")
    DB.exec("DELETE FROM checkout_record *;")
    DB.exec("DELETE FROM username *;")
    Book.add('The Great Gatsby', 'F. Scott Fitzgerald')
    User.add('Kai')
  end
end

UUID_MATCHER = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/;
