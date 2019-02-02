require_relative '../db/sql_runner'

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize (values)
    @id = values['id'].to_i if values['id']
    @name = values['name']
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1)
     RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    return Artist.new(SqlRunner.run(sql, values).first)
  end

  def self.all
    sql = "SELECT * FROM artists"
    return SqlRunner.run(sql).map {
      |artist| Artist.new(artist)
    }
  end

  def update
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end
