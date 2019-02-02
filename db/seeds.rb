require 'pry'

require_relative '../models/artist'
require_relative '../models/exhibit'

Artist.delete_all

artist1 = Artist.new({
  "name" => "Bob Ross"
  })

artist2 = Artist.new({
  "name" => "Kandinsky"
  })

artist1.save
artist2.save

exhibit1 = Exhibit.new({
  "artist_id" => artist1.id,
  "category" => "joyful"
  })

exhibit2 = Exhibit.new({
  "artist_id" => artist2.id,
  "category" => "abstract"
  })

exhibit1.save
exhibit2.save

binding.pry
nil
