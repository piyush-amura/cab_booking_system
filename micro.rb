require_relative 'vehicle'
# sedan class
class Micro < Vehicle
  @fare = 25
  def initialize(driver, number_plate = 'MH 12 BJ 6969')
    @passenger_capacity = 4
    @avg_speed = 40
    super(driver, number_plate)
  end
end
