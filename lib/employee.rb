class Employee
  attr_reader :name, :age, :salary
  
  def initialize(hash)
    @name = hash[:name]
    @age = hash[:age].to_i
    @salary = hash[:salary].delete!("$").to_i
  end

  def give_raise(amount)
    @salary += amount
  end

end