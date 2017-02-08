require_relative('../db/SqlRunner')

class Transaction

  attr_accessor(:id,:total, :name)

  def initialize (options)
    @id = options['id'].to_i
    @total = options['total'].to_i
    @name = options['name']
  end

    def save()
      sql = "INSERT INTO transactions (
        total, name
      ) VALUES (#{ @total}, '#{name}'
      ) RETURNING *"
      results = SqlRunner.run(sql)
      @id = results.first()['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM transactions"
      results = SqlRunner.run( sql )
      return results.map { |hash| Transaction.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM transactions WHERE id=#{id}"
      results = SqlRunner.run( sql )
      return Transaction.new( results.first )
    end

    def delete_all
      sql = "DELETE FROM transaction"
      SqlRunner.run( sql )
    end

    def self.destroy( id )
      sql = "DELETE FROM transactions WHERE id=#{id}"
      SqlRunner.run( sql )
    end

end