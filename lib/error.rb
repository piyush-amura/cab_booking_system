# Error module
module Errors
  # Numeric error class
  class NumericError < StandardError
    def message
      puts ' NumericError :: Input is not an numeric value!'
    end
  end

  # Class AgeError provides Age value Error
  class AgeError < StandardError
    def message
      puts ' AgeError :: Input should be between 10 to 99'
    end
  end

  # Class ContactError provides contact no. value error
  class ContactError < StandardError
    def message
      puts ' ContactError :: Input should contain valid contact no.'
    end
  end

  # Class NameError provides name error
  class NameError < StandardError
    def message
      puts ' NameError :: Input should contain valid name'
    end
  end
end
