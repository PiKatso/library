require 'sinatra'
require 'sinatra/reloader'
require './lib/library'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

post('/add-author') do
  name = params.fetch('name')
  
end
