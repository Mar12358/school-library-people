require './nameable'

class Person < Nameable
  def initialize(role, age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age.to_i
    @rentals = []
    @parent_permission = parent_permission
    @role = role
  end

  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age, :role

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    name
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end
end
Person.new('Student', 23, 'Mar')
