# module for vehicle methods
module VehicleMethods
  def calculate_fare(distance)
    self.class.fare.to_i * distance.to_i
  end

  def calculate_time(distance)
    distance.to_f / @avg_speed.to_f
  end
end
