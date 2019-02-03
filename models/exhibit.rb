require_relative '../db/sql_runner'
require 'pry'

class Exhibit

  attr_reader :id
  attr_accessor :artist_id, :category

  def initialize (values)
    @id = values['id'].to_i if values['id']
    @artist_id = values['artist_id'].to_i
    @category = values['category']
  end

  def save
    sql = "INSERT INTO exhibits (artist_id, category)
          VALUES ($1, $2) RETURNING id"
    values = [@artist_id, @category]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM exhibits WHERE id = $1"
    values = [id]
    return Exhibit.new(SqlRunner.run(sql, values).first)
  end

  def self.all
    sql = "SELECT * FROM exhibits"
    return SqlRunner.run(sql).map {
      |exhibit| Exhibit.new(exhibit)
    }
  end

  def update
    sql = "UPDATE exhibits SET (artist_id, category)
          = ($1, $2) WHERE id = $3"
    values = [@artist_id, @category, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM exhibits WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM exhibits"
    SqlRunner.run(sql)
  end

  def artist
    return Artist.find(artist_id)
  end

  def self.filter(id, category)
    sql = "SELECT * FROM exhibits
          WHERE artist_id = $1 OR category = $2"
    values = [id, category]
    return SqlRunner.run(sql, values).map {
      |exhibit| Exhibit.new(exhibit)
    }
  end

end
