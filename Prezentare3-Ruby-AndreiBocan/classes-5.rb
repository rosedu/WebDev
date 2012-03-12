# accessors :o

class Moose
  def horns=(value)
    @horns = value
  end

  def horns
    @horns
  end
end


class Animal
  attr_accessor :heads
  # heads=(value)
  # heads

  def initialize(heads)
    self.heads = heads
  end
end

a = Animal.new(2)
a.heads # => 2
a.heads = 3
a.heads # => 3

# => classes-6.rb
