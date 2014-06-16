#Create our own exception class

class PersonValidError < StandardError

  # def initialize(error_msg)
  #   super
  # end
end

class Person
  attr_accessor :name, :age

  def initialize(person)
    @name = person.keys[0]
    @age = person[@name].split(' ')[0].to_i
    @sex = person[@name].split(' ')[1]
  end

  def validate_name
    raise PersonValidError.new("Invalid name") if name.length < 2 || name.length > 10
  end

  def validate_age
    raise PersonValidError.new("Invalid age") if age < 0  || age > 115
  end
end

begin
tom = Person.new('tom', -57)
tom.validate_age


ed = Person.new('ed', 111)

jane = Person.new('j', 333)

rescue PersonValidError => e
 puts "Loool bad person"
end



