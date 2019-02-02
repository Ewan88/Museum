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
    sql = "INSERT INTO exhibits (artist_id, category)
    VALUES ($1, $2) RETURNING id"
    values = [@artist_id, @category]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  # read one
  def self.find(id)
    sql = "SELECT * FROM exhibits WHERE id = $1"
    values = [id]
    return SqlRunner.run(sql, values).map {
      |exhibit| Exhibit.new(exhibit)
    }
  end

  # read all
  def self.all
    sql = "SELECT * FROM exhibits"
    return SqlRunner.run(sql).map {
      |exhibit| Exhibit.new(exhibit)
    }
  end

  # update
  def update
    sql = "UPDATE exhibits SET (artist_id, category)
    = ($1, $2) WHERE id = $3"
    values = [@artist_id, @category, @id]
    SqlRunner.run(sql, values)
  end

  # delete one
  def delete
    sql = "DELETE FROM exhibits WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # delete all
  def self.delete_all
    sql = "DELETE FROM exhibits"
    SqlRunner.run(sql)
  end

  # view artist
  # fetch artist with id = artist_id
  def artist
    return Artist.find(artist_id)
  end

end
