require_relative 'employee'

class Manager < Employee
  attr_reader :employees, :name, :title, :salary, :boss
  def initialize(name, title, salary, boss, employees = [])
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    total_salary = 0
    @employees.each do |employee|
      total_salary += employee.salary
    end
    total_salary * multiplier
  end

  def add_employee(employee)
    if employee.is_a?(Manager)
      @employees << employee
      employee.employees.each do |emp|
        @employees << emp unless @employees.include?(emp)
      end
    else
      @employees << employee
    end
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA" , 10000, darren)


darren.add_employee(shawna)
darren.add_employee(david)

ned.add_employee(darren)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
