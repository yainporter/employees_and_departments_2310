require './lib/employee'

RSpec.describe Employee do

  describe '#initialize' do
    it 'can initialize with @name, @age, and @salary' do
      bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
      expect(bobbi).to be_an_instance_of(Employee)
      expect(bobbi.name).to eq("Bobbi Jaeger")
      expect(bobbi.age).to eq("30")
      expect(bobbi.salary).to eq(100000)
    end
  end
  
  describe "#give_raise" do
    it 'can change the salary of Employee' do
      bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
      expect(bobbi.salary).to eq(100000)
    
      bobbi.give_raise(5000)
    
      expect(bobbi.salary).to eq(105000)
    end
  end

end
