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


class Book

  def self.add(title, author)
    if Author.find(author)[0]['name'] == author
      id = Author.find(author)[0]['id']
    else
      id = Author.add(author)
    end
    DB.exec("INSERT INTO book Values (uuid_generate_v4(), '#{title}', '#{id}') RETURNING id;")
  end

  

end
