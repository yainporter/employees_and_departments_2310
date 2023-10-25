class Employee
  attr_reader :name, :age, :salary
  
  def initialize(name, age, salary)
    @name = name
    @age = age
    @salary = salary
  end

  def give_raise(amount)
    @salary += amount
  end

end