require './person'

class Teacher
  def initialize(specialization)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end