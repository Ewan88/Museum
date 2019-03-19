require 'pg'

class SqlRunner

  def self.run (sql, values = [])
    begin
      db = PG.connect({
         dbname: 'dfofa2tcutoug0',
        host: 'ec2-75-101-131-79.compute-1.amazonaws.com',
        port: '5432', user: 'qjjijgwzewwzhk',
        password: 'c00ebf77f814f5dbec16c236b729a9af7bcce4db71e73b594299c8cc6f418dbc'
        })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
