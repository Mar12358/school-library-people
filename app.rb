require './person'
require './classroom'
require './book'
require './student'
require './rental'
require './teacher'
require 'date'

class App
  def initialize
    @classroom = Classroom.new('Unknown')
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "[#{person.role}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_student(age, name, permission)
    @people << Student.new(@classroom, age, permission, name)
    puts "Student #{name} created successfully!"
  end

  def create_teacher(age, name, specialization)
    @people << Teacher.new(specialization, age, name)
    puts "Teacher #{name} created successfully!"
  end

  def create_person
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
      create_student(age, name, permission)
    elsif user_input3 == '2'
      print 'Specialization: '
      specialization = gets.chomp
      create_teacher(age, name, specialization)
    else
      puts 'Invalid Option'
    end
  end

  def create_rental
    puts 'Select person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.role}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person = @people[gets.chomp.to_i]
    puts 'Select book from the following list by number (not id)'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book = @books[gets.chomp.to_i]

    if person && book
      current_date = Date.today
      rental = Rental.new(current_date.to_s, book, person)
      person.add_rental(rental)
      book.add_rental(rental)
      @rentals << rental
      puts "Date: #{current_date}"
      puts 'Rental created successfully!'
    else
      puts 'Person or book not found. Please check the IDs and titles and try again.'
    end
  end

  def create_book
    print 'Book Title: '
    title = gets.chomp
    print 'Book Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book '#{title}' by #{author} added successfully!"
  end

  def list_rentals
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i

    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
