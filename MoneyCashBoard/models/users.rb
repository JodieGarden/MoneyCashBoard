require_relative('../db/SqlRunner')
class Merchant

  attr_accessor :id, :name

  def initialize (options)
    @id = options['id'].to_i
   @name = options['name']

  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *;"
    results = SqlRunner.run(sql).first
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run( sql )
    return results.map { |hash| Merchant.new( hash ) }
  end

  def find( id )
    sql = "SELECT * FROM merchants WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Merchant.new( results.first )
  end

  def delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run( sql )
  end

end

