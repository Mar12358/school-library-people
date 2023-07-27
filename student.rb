require './person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super('Student', age, name, parent_permission)
    @classroom = classroom
  end

  def play_hockey
    '¯(ツ)/¯'
  end
end
