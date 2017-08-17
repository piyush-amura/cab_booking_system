require_relative 'person'
# driver class
class Driver < Person
  attr_accessor :availability
   
  # constructor for driver class
  #
  #  name        string  < name for driver >
  #  contact_no  string  < contact for driver >
  #  age         integer <description>
  #
  def initialize(name, contact_no, age)
    @availability = true
    super
  end

  # function to check availability of the driver
  # @return boolean value
  def available?
    @availability
  end
end