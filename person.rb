class Person
  def initialize(name, age, _parent_permission)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  attr_reader :id
  attr_accessor :name, :age

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || parent_permission
  end
end
