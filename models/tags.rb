require_relative('../db/SqlRunner')
class Tags

  def initialize(options)
    @id = options['id'].to_i
    @user_id = options['user_id'].to_i
    @transactions_id = options['transactions_id'].to_i
    @name = options['name']
    @category = options['category']
  end

  def save()
    sql = "INSERT INTO tags (user_id, transactions_id, name, category) VALUES (#{@user_id}, #{@transactions_id}, '#{@name}', '#{@category}') RETURNING *;"
    results = SqlRunner.run(sql).first
  end

  def get_many()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run( sql )
    return results.map { |hash| Tags.new( hash ) }
  end

  def find(id)
    sql = "SELECT * FROM tags  WHERE id = #{'id'}"
    tags = SqlRunner.run(sql)
    result = Tags.new(tag.first)
    return result
  end


end 
