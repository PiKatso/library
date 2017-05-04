require 'sinatra'
require 'sinatra/reloader'
require './lib/library'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

post('/add-author') do
  first_name = params['first-name']
  last_name = params['last-name']
  author = first_name + ' ' + last_name
  Author.add(author)
  erb(:index)
end

post('/add-book') do
  title = params['title']
  author = params['author']
  Book.add(title, author)
  erb(:index)
end

get('/books/:id') do
  id = params['id']
  @book = Book.find_by_id(id)
  author = @book[0]['author_id']
  @author = Author.find_by_id(author)
  erb(:book)
end
