require 'sinatra'
require 'sinatra/reloader'
require './lib/library'
require 'pry'
enable :sessions

also_reload('lib/**/*.rb')

get('/') do
  @user_id = session[:id]
  erb(:index)
end

post('/add-author') do
  @user_id = session[:id]
  first_name = params['first-name']
  last_name = params['last-name']
  author = first_name + ' ' + last_name
  Author.add(author)
  erb(:index)
end

post('/add-book') do
  @user_id = session[:id]
  title = params['title']
  author = params['author']
  Book.add(title, author)
  erb(:index)
end

get('/login') do
  @user_id = session[:id]
  erb(:login)
end

post('/user-login') do
  username = params['user-name']
  User.add(username)
  user_id = User.find_by_name(username)[0]['id']
  session[:id] = user_id
  @user_id = session[:id]
  erb(:index)
end

get('/logout') do
  @user_id = session[:id].clear
  erb(:index)
end

get('/books/:id') do
  @user_id = session[:id]
  id = params['id']
  @book = Book.find_by_id(id)
  author = @book[0]['author_id']
  @author = Author.find_by_id(author)
  erb(:book)
end

get('/authors/:id') do
  @user_id = session[:id]
  id = params['id']
  @author = Author.find_by_id(id)
  @books = Book.find_by_author(@author[0]['name'])
  erb(:author)
end

post('/book-checkout') do
  @user_id = session[:id]
  book_id = params['book-id']
  Checkout.add(@user_id, book_id)
  erb(:index)
end

get('/search-title') do
  Book.all
  binding.pry
end
