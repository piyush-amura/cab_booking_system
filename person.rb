# person class
class Person
  attr_accessor :name, :contact_no, :age

  def initialize(name, contact_no, age)
    @name = name
    @contact_no = contact_no
    @age = age
  end
end
