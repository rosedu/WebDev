# Visibility

class Duck
  def initialize(wings)
    @wings = wings
  end

  def set_wings(value)
    self.wings = value
  end

  def wings
    @wings
  end

  def swim
    pee
    self.pee
  end

private
  def wings=(value)
    @wings = value
  end

  def pee
    "omg duck pee"
  end
end

a = Duck.new(a)
a = Duck.allocate
p a.wings
a.send(:initialize, 5)
p a.wings

# => classes-9.rb
