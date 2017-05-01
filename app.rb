require 'sinatra'
require 'sinatra/reloader'
require './lib/word_definer'
require 'pry'
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/add_word') do
  erb(:word_form)
end

post('/input_word') do
  word = params.fetch('word')
  @new_word = Word.new({:word => word})
  @new_word.save()
  definition = Definition.new(params.fetch('definition'))
  @new_word.add_definition(definition)
  @words = Word.all
  erb(:index)
end

 get('/word/:id') do
   @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  new_definition = Definition.new(params.fetch('definition'))
  @word.add_definition(new_definition)
  erb(:word)
 end
