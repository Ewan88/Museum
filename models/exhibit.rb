require_relative '../db/sql_runner'

class Exhibit

  attr_reader :id
  attr_accessor :artist_id, :category

  def initialize (values)
    @id = values['id'] if values['id']
    @artist_id = values['artist_id'] if values['artist_id']
    @category = values['category']
  end

  # create
  def save

  end

  # read one
  def view

  end

  # read all
  def self.view_all

  end

  # update
  def update

  end

  # delete one
  def delete

  end

  # delete all
  def self.delete_all

  end

end
