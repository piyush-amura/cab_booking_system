require_relative 'lib/vehicles/sedan'
require_relative 'lib/vehicles/rikshaw'
require_relative 'lib/vehicles/micro'
require_relative 'lib/user'
require_relative 'lib/error'
require_relative 'lib/validation'
# main app class
class App
  include Errors
  include Validations

  # method launches the app
  # and gives user choices
  # returns nil
  def launch
    introduction
    user_response = nil
    while user_response != 2
      user_response = menu
      puts 'invalid input' unless [1, 2].include?(user_response)
      book_a_cab if user_response == 1
    end
  end

  # method for introductory part
  # returns nil
  def introduction
    puts '----------welcome to cab booking system -------'
  end

  # methods outputs menu
  # returns user's choice
  def menu
    puts '1. Book a ride'
    puts '2. Quit'
    puts 'Enter Your Choice'
    gets.chomp.to_i
  end

  # method for boking a cab
  # returns nil
  def book_a_cab
    user = user_info
    puts 'Enter Distance to travel :'
    distance = gets.chomp
    cab = select_cab
    choice = booking_info(distance, cab, user)
    if choice == 1
      puts "your cab will come shortly \n thank you "
      exit!
    end
  end

  # method for getting user info.
  # returns object of user after validating the input
  def user_info
    puts '------Enter User Info------'
    puts 'Enter name'
    name = name_valid
    puts 'Enter Contact No.'
    contact_no = contact_number_valid
    puts 'Enter Age'
    age = age_valid
    User.new(name, contact_no, age)
  end

  
  # method for selecting type of car
  # returns object of selected class of taxi
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

  # generic methods for choices
  # accepts start and end of the choice array
  # returns user's selected option
  def choice(s, e)
    ch = gets.chomp.to_i
    until [*s..e].include?(ch)
      puts 'invalid input.Enter again'
      ch = gets.chomp.to_i
    end
    ch
  end

  # method for showing  booking info to the user
  # accepts distance,vehicle object and user object
  # returns user's decision about starting ride or canceling the ride
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
end
app = App.new
app.launch
