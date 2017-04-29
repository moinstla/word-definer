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
  erb(:add_word)
end

post('/new_word') do
  word = params.fetch('word')
  Word.new(word).save()
  @words = Word.all()
  erb(:word)
end

get('/index/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/add_definition') do
  erb(:add_definition)
end

post('/new_definition') do
  definition = params.fetch('definition')
  Definition.new(definition).save()
  @definitions = Definition.all()
 @word = Word.find(params.fetch('id').to_i())
 # @word.add_definition(@definition)
  erb(:word)
end
