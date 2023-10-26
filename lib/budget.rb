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
    employee_salaries = []
    departments.each do |department| 
      department.employees.each do |employee|
        employee_salaries << employee.salary
      end
    end
    employee_salaries
  end

  def current_expenses_by_department
    expenses = {}
    departments.each do |department|
      expenses.store(department.name,department.expenses)
    end
    expenses
  end
end