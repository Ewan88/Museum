require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/artist'

also_reload('../models.*')

get '/artists' do
  @artists = Artist.all
  erb(:"artists/index")
end

get '/artists/new' do
  erb(:"artists/new")
end

post '/artists/:id/delete' do
  Artist.find(params['id']).delete
  redirect('/artists')
end

post '/artists' do
  Artist.new(params).save
  redirect('/artists')
end
