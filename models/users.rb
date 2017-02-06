require_relative('../db/SqlRunner')
class Users

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
    @budget = options['budget'].to_i

    def save()
      sql = "INSERT INTO users (name, budget) VALUES ('#{@name}', #{@budget}) RETURNING *;"
      results = SqlRunner.run(sql).first
    end
  end

  def get_many()
    sql = "SELECT * FROM users"
    results = SqlRunner.run( sql )
    return results.map { |hash| Users.new( hash ) }
  end

  def find(id)
    sql = "SELECT * FROM users WHERE id = #{'id'}"
    user = SqlRunner.run(sql)
    result = Users.new(user.first)
    return result
  end
end



