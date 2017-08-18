require_relative 'error'

#
# Module Validation provides validation for various types of inputs
module Validations
  
  # method for validating the contact number using RegExp
  # accepts contact no.
  # returns boolean value
  def contact_number_valid(num = '')
    until num.match?(/^[1-9][0-9]{9}$/)
      begin
        num = gets.chomp
        raise Errors::ContactError unless num.match?(/^[1-9][0-9]{9}$/)
      rescue Errors::ContactError => exception
        exception.message
      end
    end
    num
  end

  # method for validating age using RegExp
  # accepts age value
  # returns boolean value according to the value
  def age_valid(num = '')
    until num.match?(/^[1-9][0-9]$/)
      begin
        num = gets.chomp
        raise Errors::AgeError unless num.match?(/^[1-9][0-9]$/)
      rescue Errors::AgeError => exception
        exception.message
      end
    end
    num
  end

  # method for validating name input using RegExp
  # accepts name value
  # returns boolean value according to the value  
  def name_valid(name = '')
    until name.split(' ').map { |el| el.match?(/^[A-Za-z]+$/) }.reduce(:&)
      begin
        name = gets.chomp
        raise Errors::NameError unless name.split(' ')
                                           .map { |el| el.match?(/^[A-Za-z]+$/) }
                                           .reduce(:&)
      rescue Errors::NameError => exception
        exception.message
      end
    end
    name
  end
end
