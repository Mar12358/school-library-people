require './person'
require './capitalize_decorator'
require './trimmer_decorator'
require './app'

def main
  app = App.new

  puts 'Welcome to School Librart App!'
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'

  user_input = gets.chomp

  case user_input
  when '1'
    puts 'You chose option 1. Doing something...'
    # Code for the first option
  when '2'
    puts 'You chose option 2. Doing something else...'
    # Code for the second option
  when '3'
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    user_input3 = gets.chomp

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    if user_input3 == '1'
      app.create_student(age, name)
    elsif user_input3 == '2'
      app.create_teacher(age, name)
    else
      puts 'Invalid Option'
    end

  else
    puts 'Invalid input. Please choose a valid option (1, 2, or 3).'
    # Code for handling invalid inputs
  end
end
