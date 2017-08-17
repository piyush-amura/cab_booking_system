require_relative 'person'
# driver class
class Driver
  attr_accessor :availability

  def initialize(name, contact_no, age)
    @availability = true
    super(name, contact_no, age)
  end

  def available?
    @availability
  end
end

