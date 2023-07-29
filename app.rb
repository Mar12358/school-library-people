require './person'
require './classroom'
require './book'
require './student'
require './rental'

class App
  def initialize
    @classroom = Classroom.new('Unknown')
    @people = []
    @books = []
    @rentals = []
  end

  def create_student(age, name)
    Student.new(classroom: @classroom, age: age, name: name)
  end

  def create_teacher(age, name)
    Teacher.new(age: age, name: name)
  end
end
