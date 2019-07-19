
class Employee

  attr_reader :name, :title, :salary, :boss, :employees
  @@employees = []
  
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @@employees << self
  end  

  def bonus(mul)
    return salary * mul
  end
  p @@employees
end

# Managers should get a bonus based on the total salary of all of their 
# subordinates, as well as the manager's subordinates' subordinates, and the 
# subordinates' subordinates' subordinates, etc.
class Manager < Employee

  attr_reader :name, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
  end

  # Tracks a manager's(self's) subordinates(sub employees) 
  def sub_employees
    subordinates = []
    p @@employees
    @@employees.each do |employee|
      if employee.boss == self.name
        subordinates << employee
      end
    end

    return subordinates
  end

  def bonus(mul)
    bonus = 0
    subordinates = self.sub_employees()

    subordinates.each do |employee|
      if employee.class == Manager
        bonus += employee.salary * mul + employee.bonus(mul)
      else
        bonus += employee.salary * mul
      end
    end

    return bonus
  end

end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
david = Employee.new("David", "TA", 10000, "Darren")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")

# p ned.bonus(5) # => 500_000
# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000
