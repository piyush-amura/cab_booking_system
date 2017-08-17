require_relative 'error'
# def
def name_valid(name)
  until name.split(' ').map { |el| el.match?(/^[A-Za-z]+$/) }.reduce(:&)
    puts 'invalid input for name'
    name = gets.chomp
  end
  name 
end
p name_valid('r578gfsd')
# def contact_no_valid(num)
#   until num.match?(/^[0-9]+{10}/)
#     puts 'invalid input for contact no.'
#     num = gets.chomp
#   end
#   num
# end
# p contact_no_valid('dfghjstdfgh66')
# def age_valid
#   num=0
#   while num.zero?
#     begin
#       puts 'Enter age' 
#       num = gets.chomp
#       raise Errors::NumericError if num.match?(/^-?[0-9]+$/)
#       rescue Errors::NumericError => exception
#       exception.message
#     end
#     num.to_i
#   end
#   num
# end
# p age_valid