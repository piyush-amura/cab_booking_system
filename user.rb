require_relative 'person'

# user class
class User < Person
    
  attr_accessor :total_rides, :first_ride

  def initialize(name, contact_no, age)
    @total_rides = 0
    @first_ride = true
    super(name, contact_no, age)
  end

  def first_ride?
    @first_ride
  end
  
end

