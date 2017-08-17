require_relative 'sedan'
require_relative 'rikshaw'
require_relative 'micro'
require_relative 'user'
require_relative 'error'
# main app class
class App
  include Errors
  
  def launch
    introduction
    user_response = nil
    while user_response != 2
      user_response = menu
      puts 'invalid input' unless [1, 2].include?(user_response)
      book_a_cab if user_response == 1
    end
  end

  def introduction
    puts '----------welcome to cab booking system -------'
  end

  def menu
    puts '1. Book a ride'
    puts '2. Quit'
    puts 'Enter Your Choice'
    gets.chomp.to_i
  end

  def book_a_cab
    user = user_info
    puts 'Enter Distance to travel :'
    distance = gets.chomp
    cab = select_cab
    choice = booking_info(distance, cab, user)
    if choice == '1'
      puts "your cab will come shortly \n thank you "
      exit!
    end
  end

  def user_info
    puts '------Enter User Info------'
    puts 'Enter name'
    name = name_valid(gets.chomp)
    puts 'Enter Contact No.'
    contact_no = contact_number_valid(gets.chomp)
    puts 'Enter Age'
    age = age_valid
    User.new(name, contact_no, age)
  end

  def select_cab
    puts "1. Sedan class fare    : #{Sedan.fare} Rs/km"
    puts "2. Micro class fare    : #{Micro.fare} Rs/km"
    puts "3. Rikshaw class fare  : #{Rikshaw.fare} Rs/km"
    puts 'Enter Your Choice'
    case choice(1, 3)
    when 1 then taxi = Sedan.new('Mr. santosh mane')
    when 2 then taxi = Micro.new('Mr. santosh mane')
    when 3 then taxi = Rikshaw.new('Mr. santosh mane')
    end
    taxi
  end

  def choice(s, e)
    choice = gets.chomp.to_i
    until [*s..e].include?(choice)
      puts 'invalid input.Enter again'
      choice = gets.chomp.to_i
    end
    choice
  end

  def booking_info(distance, cab, user)
    puts "Dear #{user.name}"
    puts "You have selected car of #{cab.class} class"
    puts "Car no.     : #{cab.number_plate}"
    puts "Driver name : #{cab.driver}"
    puts "Total Fare  : #{cab.calculate_fare(distance)} Rs"
    puts "Ride Time   : #{cab.calculate_time(distance)} Hrs. \n "
    puts '1.start ride'
    puts '2.cancel ride'
    choice(1, 2)
  end

  def contact_number_valid(num)
    until num.match?(/^[0-9]+{10}/)
      puts 'invalid input for contact no.'
      num = gets.chomp
    end
    num
  end

  def age_valid
    num = 0
    while(num.zero?)
      begin
        num = gets.chomp.to_i
        raise Errors::NumericError if num.zero?
      rescue Errors::NumericError => exception
        exception.message
      end
    end
    num
  end

  def name_valid(name)
    until name.split(' ').map { |el| el.match?(/^[A-Za-z]+$/) }.reduce(:&)
      puts 'invalid input for name'
      name = gets.chomp
    end
    name
  end

end
app = App.new
app.launch
  