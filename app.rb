require 'sinatra'
require 'sinatra/reloader'
require './lib/library'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

post('/add-author') do
  first_name = params.fetch('first-name')
  last_name = params.fetch('last-name')
  Author.add(first_name, last_name)
  erb(:index)
end
