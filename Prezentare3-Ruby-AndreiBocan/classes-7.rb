# methods vs variables
class Goat
  attr_accessor :feet

  def set_feet(other)
    feet = other
  end

  def set_more_feet(other)
    self.feet = other
  end

private
  def moo
    :moo
  end
end

a = Goat.new
a.set_feet(2)
a.feet # => nil

a.set_more_feet(2)
a.feet # => 2

a.feet = 3
a.feet # => 3

p a.send(:moo)


# => classes-8.rb
