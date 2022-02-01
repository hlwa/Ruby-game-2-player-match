class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  # def rename(n)
  #   @name = n
  # end

end

p = Person.new('L. Ron')
puts p.name
p.name = "wang"
puts p.name