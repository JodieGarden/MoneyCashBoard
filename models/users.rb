require_relative('../db/SqlRunner')
class Users

  def initialize (options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @budget = options['budget'].to_i

    def save()
      sql = "INSERT INTO users (name, budget) VALUES ('#{@name}', #{@budget}) RETURNING *;"
      results = SqlRunner.run(sql).first
    

    end
  end
end


