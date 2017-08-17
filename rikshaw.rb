require_relative 'vehicle'
# sedan class
class Rikshaw < Vehicle
  @fare = 15
  def initialize(driver, number_plate = 'MH 12 BJ 6969')
    @passenger_capacity = 3
    @avg_speed = 35
    super(driver, number_plate)
  end
end
