require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'library'})

class Author

  def self.add(name)
    DB.exec("INSERT INTO author VALUES (uuid_generate_v4(), '#{name}') RETURNING id;")
  end

  def self.find(name)
    DB.exec("SELECT * FROM author WHERE name = '#{name}';")
  end

end
