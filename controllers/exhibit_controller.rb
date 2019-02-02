require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/exhibit'
require_relative '../models/artist'

also_reload '../models.*'

get '/exhibits' do
  @exhibits = Exhibit.all
  erb(:"exhibits/index")
end

get '/exhibits/new' do
  @artists = Artist.all
  erb(:"exhibits/new")
end


get '/exhibits/:id' do
  @exhibit = Exhibit.find(params['id']).first
  erb(:"exhibits/show")
end

get '/exhibits/:id/edit' do
  @artists = Artist.all
  @exhibit = Exhibit.find(params['id']).first
  erb(:"exhibits/edit")
end

post '/exhibits/:id' do
  Exhibit.new(params).update
  redirect("/exhibits/#{params['id']}")
end

post '/exhibits/:id/delete' do
  Exhibit.find(params['id']).first.delete
  redirect('/exhibits')
end

post '/exhibits' do
  Exhibit.new(params).save
  redirect('/exhibits')
end
