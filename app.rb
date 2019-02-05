require 'sinatra'
require 'sinatra/contrib/all'
require 'wikipedia'

require_relative 'controllers/artist_controller'
require_relative 'controllers/exhibit_controller'


get '/' do
  erb(:index)
end
