# Error module
module Errors
  # Numeric error class
  class NumericError < StandardError
    def message
      puts ' NumericError :: Input is not an numeric value!'
    end
  end
end
