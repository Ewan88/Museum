require 'sinatra'
require 'sinatra/contrib/all'

require_relative 'controllers/artist_controller'
require_relative 'controllers/exhibit_controller'

also_reload './models/*'

get '/' do
  erb(:index)
end
