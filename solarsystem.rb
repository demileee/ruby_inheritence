class System
  @@bodies = []

  attr_reader :bodies

  def self.add(body)
    @@bodies << body
    return @@bodies
  end

  def self.total_mass
    @@bodies.each do |body|
      bodymass = body.select {|k, v| k == "mass"}
      return bodymass.inject(0) { |sum, (k, v)| sum + v}
    end
  end

  def self.bodies
    return @@bodies
  end
end

class Body < System
  def initialize(name, mass)
    @name = name
    @mass = mass
  end

  # def name_check(name)
  #   count = 0
  #   @@bodies.each do |body|
  #     if @name == name
  #       puts "This name is taken!"
  #       count = 1
  #     end
  #   end
  #   return false if count == 0
  # end
end

class Planet < Body

  def initialize(name, mass)
    super
    puts "How many hours does it take for the planet to rotate all the way around once?"
    @day = gets.chomp.to_i
    puts "How many days does it take to orbit around the Sun once?"
    @year = gets.chomp.to_i
    puts "Planet has been created!"
  end

  def self.create
    puts "\nWhat would you like to name your new planet?"
    name = gets.chomp
    puts "What would be this planet's mass in kg?"
    mass = gets.chomp.to_i
    Planet.new(name, mass)
  end
end

class Star < Body
  attr_accessor :type

  def initialize(name, mass)
    super
    puts "What type of star is it?"
    @type = gets.chomp
    puts "Star has been created!"
  end

  def self.create
    puts "\nWhat would you like to name your new star?"
    name = gets.chomp
    puts "What would be this star's mass in kg?"
    mass = gets.chomp.to_i
    Star.new(name, mass)
  end
end

class Moon < Body
  attr_accessor :month

  def initialize(name, mass)
    super
    puts "Which planet does this moon orbit around?"
    @planet = gets.chomp
    puts "How many days does it take for the moon to rotate #{@planet} all the way around once?"
    @month = gets.chomp
    puts "Moon has been created!"
  end

  # def self.name_check(name)
  #   if @@bodies.count > 0
  #     count = 0
  #     @@bodies.each do |body|
  #       if @name == name
  #         puts "This name is taken!"
  #         count = -1
  #       else
  #         count += 1
  #       end
  #     end
  #     return false if count >= 1
  #   elsif @@bodies.count == nil
  #     return false
  #   end
  # end

  def self.create
    # until false
      puts "\nWhat would you like to name your new moon?"
      name = gets.chomp
    #   Moon.name_check(name)
    # end
    puts System.bodies.inspect
    puts "What would be this moon's mass in kg?"
    mass = gets.chomp.to_i
    Moon.new(name, mass)
  end
end

# mars = Planet.create
moon = Moon.create
System.add(moon)
# puts mars.inspect
puts moon.inspect
othermoon = Moon.create
System.add(othermoon)
puts System.bodies.inspect
