# Is-A, Has-A, Objects, and Classes

# Animal is an Object
class Animal
end

## A Dog is an Animal
class Dog < Animal

  # Creates a new Dog
  def initialize(name)
    @name = name    
  end
end

# A Cat is an Animal
class Cat < Animal

  # Creates a new Cat
  def initialize(name)
    @name = name    
  end
end

# Person is an Object
class Person

  # Person has a pet of some kind
  attr_accessor :pet

  def initialize(name)
    @name = name
    @pet = nil    
  end

end

# An Employee is a Person
class Employee < Person
  def initialize name, salary
    # Calls the constructor of the superclass
    super name
    @salary = salary    
  end
end

# A Fish is an Object
class Fish
end

# A Salmon is a Fish
class Salmon < Fish
end

# A Halibut is a Fish
class Halibut < Fish
end

# Create new objects
rover = Dog.new "Rover"
tom = Cat.new "Tom"
mary = Person.new "Mary"
frank = Employee.new "Frank", "128000"

# Mary's pet is tom
mary.pet = tom

# Frank's pet is rover
frank.pet = rover

# Create new fishes
flipper = Fish.new
nemo = Salmon.new
jeremy = Halibut.new