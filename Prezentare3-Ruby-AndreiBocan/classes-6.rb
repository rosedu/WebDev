class Animal
  attr_reader :feet

  def initialize(feet)
    @feet = feet
  end
end

a = Animal.new(2)
a.feet # => 2
a.feet = 2 # Blow up


# => classes-7.rb
