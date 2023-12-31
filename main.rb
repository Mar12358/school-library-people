require './person'
require './capitalize_decorator'
require './trimmer_decorator'
require './app'

puts 'Welcome to School Librart App!'
app = App.new

loop do
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
    app.list_books
  when '2'
    app.list_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals
  when '7'
    puts 'Bye bye'
    break
  else

    puts 'Invalid input. Please choose a valid option (1 to 7).'
    # Code for handling invalid inputs
  end
end
