require './lib/employee'
require './lib/department'

RSpec.describe Department do

  describe '#initialize' do
    it 'can initialize with @name and @employees' do
      customer_service = Department.new("Customer Service") 

      expect(customer_service).to be_an_instance_of(Department)
      expect(customer_service.name).to eq("Customer Service")
      expect(customer_service.employees).to eq([])

    end

    it 'also has an attribute @expenses' do
      customer_service = Department.new("Customer Service") 

      expect(customer_service.expenses).to eq(0)
    end
  end
  
  describe "#hire" do
    it 'can add Employee to @employees' do
      customer_service = Department.new("Customer Service") 
      bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
      aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})  

      expect(customer_service.employees).to eq([])

      customer_service.hire(bobbi)
      customer_service.hire(aaron)  

      expect(customer_service.employees).to eq([bobbi, aaron])
    end
  end

  describe '#expense' do
    it 'can keep track of expenses for the Department' do
      customer_service = Department.new("Customer Service") 

      expect(customer_service.expenses).to eq(0)

      customer_service.expense(100)
      customer_service.expense(25)  

      expect(customer_service.expenses).to eq(125)
    end
  end

end