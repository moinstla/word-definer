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
  word = Word.new(params.fetch('word'))
  word.save()
  @thisword = word.name()
  erb(:words)
end

get('/index/:id') do
  @word = Word.find(params.fetch('id').to_i())
  @definitions = Definition.all()
  erb(:definitions)
end

get('/new_definition') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definitions)
end

post('/new_definition') do
  definition = params.fetch('definition')
  @definition = Definition.new(definition)
  @definition.save()
  @definitions = Definition.all()
  erb(:definitions)
end
