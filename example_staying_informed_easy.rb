# Chapter 5. Keeping Up with the Times with the Observer
# prebuild Observer Module
require 'observer'

class Employee
include Observable

attr_reader :name, :address
attr_reader :salary

  def initialize( name, title, salary)
   @name = name
   @title = title
   @salary = salary
  end
end