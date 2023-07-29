require './person'
require './classroom'
require './book'
require './student'
require './rental'
require './teacher'

class App
  def initialize
    @classroom = Classroom.new('Unknown')
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "#{person.role} - #{person.name}" }
  end

  def create_student(age, name, permission)
    @people << Student.new(@classroom, age, name, permission) # Use @classroom instead of classroom:
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
    @people.each_with_index { |person, index| puts "#{index}) #{person.role} - #{person.name}" }
    person_choice = gets.chomp.to_i
    person = @people[person_choice]
    puts 'Select book from the following list by number (not id)'
    @books.each_with_index { |book, index| puts "#{index}) #{book.title} by #{book.author}" }
    book_choice = gets.chomp.to_i
    book = @books[book_choice]

    if person && book
      rental = Rental.new('2023-07-26', book, person)
      person.add_rental(rental, book)
      book.add_rental(rental)
      @rentals << rental
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
    person = @people.find { |p| p.id == person_id }
    if person
      puts "Rentals for #{person.name}:"
      person.rentals.each do |rental|
        puts "#{rental.book.title} (#{rental.date})"
      end
    else
      puts 'Person not found. Please check the ID and try again.'
    end
  end
end
