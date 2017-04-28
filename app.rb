require 'sinatra'
require 'sinatra/reloader'
require './lib/word_definer'
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/add_word') do
  erb(:add_word)
end

post('/new_word') do
  erb(:word)
end

get('/add_definition') do
  erb(:add_definition)
end

post('/new_definition') do
  erb(:word)
end
