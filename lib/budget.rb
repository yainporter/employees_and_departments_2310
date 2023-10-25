class Budget
  attr_reader :year, :departments

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def departments_with_low_expenses
    departments.find_all{|department| department.expenses < 500}
  end

  def employee_salaries
    salaries = []
    departments.each do |department| 
      salaries.flatten.each do |employee| 
        salaries << employee.salary
        require 'pry'; binding.pry
      end
    end
    salaries
  end
end