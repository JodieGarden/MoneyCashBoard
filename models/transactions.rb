require_relative('../db/SqlRunner')

class Transactions

  attr_accessor(:id, :original_total, :total)

  def initialize (options)
    @id = options['id'].to_i
    @original_total = options['original_total'].to_i
    @total = options['total'].to_i
  end

  def save()
    sql = "INSERT INTO transactions (original_total, total) VALUES (#{@original_total}, #{@total}) RETURNING *;"
    results = SqlRunner.run(sql).first
  end

  def get_many()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run( sql )
    return results.map { |hash| Transactions.new( hash ) }
  end

  def find(id)
    sql = "SELECT * FROM transactions WHERE id = #{'id'}"
    transaction = SqlRunner.run(sql)
    result = Transactions.new(transaction.first)
    return result
  end


end

