require_relative '../db/sql_runner'

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize (values)
    @id = values['id'].to_i if values['id']
    @name = values['name']
  end

  # create
  def save
    sql = "INSERT INTO artists (name) VALUES ($1)
     RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  # read one
  def self.select(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    return SqlRunner.run(sql, values).map {
      |artist| Artist.new(artist)
    }
  end

  # read all
  def self.all
    sql = "SELECT * FROM artists"
    return SqlRunner.run(sql).map {
      |artist| Artist.new(artist)
    }
  end

  # update
  def update
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  # delete one
  def delete
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # delete all
  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end
