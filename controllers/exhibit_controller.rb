require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'
require 'wikipedia'

require_relative '../models/exhibit'
require_relative '../models/artist'

also_reload('../models.*')

get '/exhibits' do
  if !params.empty?
    @exhibits = Exhibit.filter(params['id'].to_i, params['category'])
    @artists = []
    @exhibits.each { |exhibit|
      @artists.push(exhibit.artist)
    }
  else
    @exhibits = Exhibit.all
    @artists = Artist.all
  end
  erb(:"exhibits/index")
end

get '/exhibits/new' do
  @artists = Artist.all
  erb(:"exhibits/new")
end

get '/exhibits/:id' do
  @exhibit = Exhibit.find(params['id'])
  @images = Wikipedia.find(@exhibit.artist.name).image_urls
  if @images
    @images.each {
      |image| @images.delete(image) if image.include? ".svg"
    }
  end
  # binding.pry
  erb(:"exhibits/show")
end

get '/exhibits/:id/edit' do
  @artists = Artist.all
  @exhibit = Exhibit.find(params['id'])
  erb(:"exhibits/edit")
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
