require './person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super('Student', age, name, parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  attr_accessor :classroom

  def play_hockey
    '¯(ツ)/¯'
  end
end
