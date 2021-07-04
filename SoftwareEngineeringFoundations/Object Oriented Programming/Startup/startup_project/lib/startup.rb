require "employee"
require 'byebug'

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        if salaries.keys.include?(title) then return true else false end
    end

    def >(startup)
        if funding > startup.funding then return true else false end
    end
    
    def hire(employee_name, employee_title)
        #debugger
        if !valid_title?(employee_title)
            raise "Not a valid title!"
        else
            employee = Employee.new(employee_name, employee_title)
            employees << employee
        end
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        title = employee.title
        if @funding >= salaries[title]
            employee.pay(salaries[title])
            @funding -= salaries[title]
        else
            raise "Not enough funding"
        end
    end

    def payday
        employees.each { |employee| pay_employee(employee)}
    end

    def average_salary
        pays = employees.inject([]) {|acc, emp| acc << salaries[emp.title]}
        pays.sum / pays.length  
    end

    def close
        @employees = []
        @funding =  0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title, salary|
            if !salaries.keys.include?(title)
                salaries[title] = salary
            end
        end
        employees.push(*startup.employees)
        startup.close
    end
end
