# Chapter 5. Keeping Up with the Times with the Observer
class Employee 
include Subject

  attr_reader :name, :address
  attr_reader :salary

  def initialize( name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

# Module 
module Subject
  def initialize
    @observers=[]
  end

  # Add and delete observers from Employee object
  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

# MAYBE DELETE LATER
class Payroll
  def update( changed_employee )
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class TaxMan
  def update( changed_employee )
    puts("Send #{changed_employee.name} a new tax bill!")
  end
end



# Sample 

# tax_man = Taxman.new
# fred.add_observer(tax_man)
# fred = Employee.new("Fred Flinstone", "Crane Operator", 30,000.0)
# payroll = Payroll.new
# fred.add_observer( payroll )
# fred.salary=35,000.0

