require 'sinatra'
require 'sinatra/reloader'
require './lib/Word_Definer'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
