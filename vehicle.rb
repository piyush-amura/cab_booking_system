require_relative 'driver'
require_relative 'vehicle_methods'

# vehicle class
class Vehicle
  include VehicleMethods
  @fare = nil
  attr_accessor :number_plate, :driver, :avg_speed, :passenger_capacity
  
  def initialize(driver, number_plate)
    @number_plate = number_plate
    @driver = driver
  end

  def passenger_exceeded?(no_of_passenger)
    @passenger_capacity < no_of_passenger
  end

  def self.fare
    @fare
  end  
end
