require_relative 'error'

#
# Module Validation provides validation for various types of inputs
module Validations
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
