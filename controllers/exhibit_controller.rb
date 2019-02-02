require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

require_relative '../models/exhibit'
require_relative '../models/artist'

also_reload './models.*'

get '/exhibits' do
  @artists = Artist.all
  @exhibits = Exhibit.all
  erb(:"exhibits/index")
end

get '/exhibits/new' do
  @artists = Artist.all
  erb(:"exhibits/new")
end

get '/exhibits/:id' do
  @exhibit = Exhibit.find(params['id'])
  erb(:"exhibits/show")
end

get '/exhibits/:id/edit' do
  @artists = Artist.all
  @exhibit = Exhibit.find(params['id'])
  erb(:"exhibits/edit")
end

post '/exhibits/filter' do
  @artists = Artist.all
  # binding.pry
  @exhibits = Exhibit.filter(params['id'])
  erb(:"exhibits/index")
end

post '/exhibits/:id' do
  Exhibit.new(params).update
  redirect("/exhibits/#{params['id']}")
end

post '/exhibits/:id/delete' do
  Exhibit.find(params['id']).delete
  redirect('/exhibits')
end

post '/exhibits' do
  Exhibit.new(params).save
  redirect('/exhibits')
end
