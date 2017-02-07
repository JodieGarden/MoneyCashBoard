require_relative('../db/SqlRunner')

class Transaction

  attr_accessor(:id,:total)

  def initialize (options)
    @id = options['id'].to_i
    @total = options['total'].to_i
  end

    def save()
      sql = "INSERT INTO transactions (
        total
      ) VALUES (#{ @total}
      ) RETURNING *"
      results = SqlRunner.run(sql)
      @id = results.first()['id'].to_i
    end

    def all()
      sql = "SELECT * FROM transactions"
      results = SqlRunner.run( sql )
      return results.map { |hash| Transaction.new( hash ) }
    end

    def find( id )
      sql = "SELECT * FROM transactions WHERE id=#{id}"
      results = SqlRunner.run( sql )
      return Transaction.new( results.first )
    end

    def delete_all
      sql = "DELETE FROM transaction"
      SqlRunner.run( sql )
    end

end