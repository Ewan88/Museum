require 'pry'

require_relative '../models/artist'
require_relative '../models/exhibit'

Artist.delete_all

artist1 = Artist.new({
  "name" => "Bob Ross"
  })
  artist1.save

artist2 = Artist.new({
  "name" => "Kandinsky"
  })
  artist2.save




binding.pry
nil
