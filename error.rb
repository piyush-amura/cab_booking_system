# Error module
module Errors
  # Numeric error class
  class NumericError < StandardError
    def message
      puts ' NumericError :: Input is not an numeric value!'
    end
  end

  #
  # Class AgeError provides Age value Error
  #
  # @author Joe Blog <Joe.Blog@nowhere.com>
  #
  class AgeError < StandardError
    def message
      puts ' AgeError :: Input should be between 10 to 99'
    end
  end
end
