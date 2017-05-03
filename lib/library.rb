require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'library'})

class Author

  def self.add(first_name, last_name)
    full_name = first_name + " " + last_name
    DB.exec("INSERT INTO author VALUES (uuid_generate_v4(), '#{full_name}') RETURNING id;")
  end

  def self.find_by_id(value)
    DB.exec("SELECT * FROM author WHERE 'id' = '#{value}';")
  end

  def self.find_by_name(name)
    DB.exec("SELECT * FROM author WHERE 'name' = '#{name}';")
  end

  def self.all
    DB.exec("SELECT * FROM author;")
  end

end


class Book

  def self.all
    DB.exec("SELECT * FROM book;")
  end

  def self.add(title, author)
    if Author.find(author).ntuples > 0
      id = Author.find(author)[0]['id']
    else
      id = Author.add(author)[0]['id']
    end
    DB.exec("INSERT INTO book Values (uuid_generate_v4(), '#{title}', '#{id}') RETURNING id;")
  end

  def self.find(title)
    DB.exec("SELECT * FROM book WHERE title = '#{title}';")
  end

end

class Patreon

  def self.add(first_name, last_name, book_id)
    full_name = first_name + " " + last_name
    DB.exec("INSERT INTO Patreon VALUES (uuid_generate_v4(), '#{full_name}', '#{book_id}', '#{Date.today}') RETURNING id;")
  end

  def self.find(name)
    DB.exec("SELECT * FROM patreon WHERE name = '#{name}';")
  end

  def self.all
    DB.exec("SELECT * FROM patreon;")
  end

end
