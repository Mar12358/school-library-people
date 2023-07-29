require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super('Teacher', age, name, true)
    @specialization = specialization
    @role = 'Teacher'
  end

  def can_use_services?
    true
  end
end
