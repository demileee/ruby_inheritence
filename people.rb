class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{@name}."
  end

end

class Student < Person

  def learn
    puts "I get it!"
  end

end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object."
  end
end

nadia = Instructor.new("Nadia")
chris = Student.new("Chris")
nadia.greeting
chris.greeting
nadia.teach
chris.learn
# chris.teach
### the above does not work because there is no teach method in either
### the Student or Person class.
