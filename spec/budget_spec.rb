require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe Budget do
  describe '#initialize' do
    it 'can initialize with @year, @departments' do
      budget = Budget.new(2023)

      expect(budget).to be_an_instance_of(Budget)
      expect(budget.year).to eq(2023)
      expect(budget.departments).to eq([])
    end
  end

  describe '#add_department(department)' do
    it 'can add Department to @departments' do
      budget = Budget.new(2023)
      customer_service = Department.new("Customer Service") 
      budget.add_department(customer_service)

      expect(budget.departments).to eq([customer_service])
      expect(budget.departments).to be_an_instance_of(Array)
    end
  end

  describe '#departments_with_low_expenses' do
    it 'can list all departments with expenses less than $500' do
      budget = Budget.new(2023)
      customer_service = Department.new("Customer Service") 
      hr = Department.new("Human Resources")
      budget.add_department(customer_service)
      budget.add_department(hr)
      customer_service.expense(100)
      customer_service.expense(25)
      hr.expense(500)

      expect(budget.departments_with_low_expenses).to be_an_instance_of(Array)
      expect(budget.departments_with_low_expenses).to eq([customer_service])
    end
  end

  describe '#employee_salaries' do
    it 'can list all employees salaries' do
      budget = Budget.new(2023)
      customer_service = Department.new("Customer Service") 
      hr = Department.new("Human Resources")
      budget.add_department(customer_service)
      budget.add_department(hr)
      bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
      aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "$90000"})  
      tom = Employee.new({name: "Thomas Clark", age: "25", salary: "$150000"})  
      customer_service.hire(bobbi)
      customer_service.hire(aaron) 
      hr.hire(tom)

      expect(budget.employee_salaries).to be_an_instance_of(Array)
      expect(budget.employee_salaries).to eq([100000, 90000, 150000])
    end
  end

  describe '#current_expenses_by_department' do
    it 'can keep track of all expenses from departments' do
      budget = Budget.new(2023)
      customer_service = Department.new("Customer Service") 
      hr = Department.new("Human Resources")
      budget.add_department(customer_service)
      budget.add_department(hr)
      customer_service.expense(100)
      customer_service.expense(25)
      hr.expense(500)

      expect(budget.current_expenses_by_department).to be_an_instance_of(Hash)
      expect(budget.current_expenses_by_department).to eq ({"Customer Service"=>125, "Human Resources"=>500})
    end
  end
end