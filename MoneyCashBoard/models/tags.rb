require_relative('../db/SqlRunner')
class Tags

  attr_accessor :id, :merchant_id, :transactions_id, :name, :category

  def initialize(options)
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @transactions_id = options['transactions_id'].to_i
    @name = options['name']
    @category = options['category']
  end

  def save()
    sql = "INSERT INTO tags(merchant_id, transactions_id, name, category ) VALUES (#{@merchant_id}, #{@transactions_id}, '#{@name}', '#{@category}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM victims"
    results = SqlRunner.run( sql )
    return results.map { |hash| Victim.new( hash ) }
  end

  def find( id )
    sql = "SELECT * FROM victims WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Victim.new( results.first )
  end

  def delete_all
    sql = "DELETE FROM victims"
    SqlRunner.run( sql )
  end

  def transactions
    sql = "SELECT * FROM transactions tr
          INNER JOIN tags tg
          ON tg.transactions_id = tr.id
          WHERE tr.id = #{@transactions_id}"
    results = SqlRunner.run( sql )
    return Transactions.new( results.first )
  end

  def merchants
    sql = "SELECT * FROM merchants me
          INNER JOIN tags tg
          ON tg.merchant_id = me.id
          WHERE me.id = #{@merchant_id}"
    results = SqlRunner.run( sql )
    return Merchants.new( results.first )
  end

end

