class Classroom
  def initialize(label = 'Unknown')
    @label = label
    @students = [] # Initialize an empty array to store students
  end

  attr_accessor :label
  attr_reader :students # Add a reader method to access the students array

  def add_student(student)
    @students << student
    student.classroom = self # Set the classroom for the student
  end
end
