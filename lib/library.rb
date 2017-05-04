require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'library'})

class User

  def self.add(username)
    DB.exec("INSERT INTO username VALUES (uuid_generate_v4(), '#{username.downcase}') RETURNING id;") unless User.find_by_name(username).any?
  end

  def self.find_by_id(id)
    DB.exec("SELECT * FROM username WHERE id = '#{id}';")
  end

  def self.find_by_name(name)
    DB.exec("SELECT * FROM username WHERE name = '#{name.downcase}';")
  end

end

class Author

  def self.add(author)
    DB.exec("INSERT INTO author VALUES (uuid_generate_v4(), '#{author.downcase}') RETURNING id;")
  end

  def self.find_by_id(value)
    DB.exec("SELECT * FROM author WHERE id = '#{value}';")
  end

  def self.find_by_name(name)
    DB.exec("SELECT * FROM author WHERE name = '#{name.downcase}';")
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
    if Author.find_by_name(author).any?
      id = Author.find_by_name(author)[0]['id']
    else
      id = Author.add(author)[0]['id']
    end
    unless Book.find_by_title(title).any?
    DB.exec("INSERT INTO book Values (uuid_generate_v4(), '#{title.downcase}', '#{id}') RETURNING id;")
    end
  end

  def self.find_by_title(title)
    DB.exec("SELECT * FROM book WHERE title = '#{title.downcase}';")
  end

  def self.find_by_id(id)
    DB.exec("SELECT * FROM book WHERE id = '#{id}';")
  end

  def self.find_by_author(author)
    author_id = Author.find_by_name(author)[0]['id']
    DB.exec("SELECT * FROM book WHERE author_id = '#{author_id}';")
  end

end

class Checkout

  def self.add(user_id, book_id)
    DB.exec("INSERT INTO checkout_record Values (uuid_generate_v4(), '#{user_id}', '#{book_id}', '#{Date.today}') RETURNING id;")
  end

  def self.find_by_user(user_id)
    DB.exec("SELECT * FROM checkout_record WHERE user_id = '#{user_id}';")
  end

  def self.find_by_book(book_id)
    DB.exec("SELECT * FROM checkout_record WHERE book_id = '#{book_id}';")
  end

end
