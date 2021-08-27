class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        boss.addEmployee(self) unless boss.nil?
    end
    def bonus(multiplier)
        bonus = salary * multiplier
    end
    def isManager?
        false
    end
end

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end
    def addEmployee(employee)
        employees.push(employee)
    end
    def bonus(multiplier)
        bonus = totalSalary * multiplier
    end
    def totalSalary
        sum = 0
        employees.each do |employee|
            if employee.isManager?
                sum += employee.totalSalary
            end
            sum  += employee.salary
        end
        sum
    end
    def isManager?
        true
    end
end
ned = Manager.new('Ned', 'Founder', 1000000)
darren = Manager.new('Darren', 'TA Manager', 78000, ned)
shawna = Employee.new('Shawna',	'TA', 12000,	darren)
david = Employee.new('David',	'TA', 10000,	darren)
p    ned.bonus(5) # => 500_000
p    darren.bonus(4) # => 88_000
p    david.bonus(3) # => 30_000