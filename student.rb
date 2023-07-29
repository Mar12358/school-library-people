require './person'

class Student < Person
  def initialize(classroom, age, parent_permission, name = 'Unknown', role = 'Student')
    super(role, age, name)
    @classroom = classroom
    classroom.add_student(self)
    @parent_permission = parent_permission
  end

  attr_accessor :classroom
  attr_reader :parent_permission

  def play_hockey
    '¯(ツ)/¯'
  end
end
