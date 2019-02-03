require 'pry'

require_relative '../models/artist'
require_relative '../models/exhibit'

Exhibit.delete_all
Artist.delete_all

artist1 = Artist.new({
  "name" => "Claude Monet"
  })

artist2 = Artist.new({
  "name" => "Kandinsky"
  })

artist3 = Artist.new({
  "name" => "William McTaggart"
  })

artist1.save
artist2.save
artist3.save

exhibit1 = Exhibit.new({
  "artist_id" => artist1.id,
  "category" => "Impressionist"
  })

exhibit2 = Exhibit.new({
  "artist_id" => artist2.id,
  "category" => "Abstract"
  })

exhibit3 = Exhibit.new({
  "artist_id" => artist3.id,
  "category" => "Impressionist"
  })

exhibit1.save
exhibit2.save
exhibit3.save

binding.pry
nil
