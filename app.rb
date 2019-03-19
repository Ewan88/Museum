require 'sinatra'
require('sinatra/contrib/all') if development?
require 'wikipedia'

require_relative 'controllers/artist_controller'
require_relative 'controllers/exhibit_controller'

get '/' do
  erb(:index)
end
