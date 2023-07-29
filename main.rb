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
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    user_input3 = gets.chomp

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    if user_input3 == '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      permission = permission.downcase == 'y'
      app.create_student(age, name, permission)
    elsif user_input3 == '2'
      print 'Specialization: '
      specialization = gets.chomp
      app.create_teacher(age, name, specialization)
    else
      puts 'Invalid Option'
    end
  when '4'
    print 'Book Title: '
    title = gets.chomp
    print 'Book Author: '
    author = gets.chomp
    app.create_book(title, author)
  when '6'
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i
    app.list_rentals(person_id)
  when '7'
    puts 'Bye bye'
      break
  else

    puts 'Invalid input. Please choose a valid option (1 to 7).'
    # Code for handling invalid inputs
  end
end