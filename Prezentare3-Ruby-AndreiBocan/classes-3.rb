class Animal
  def self.moo
    puts :bar
  end

  moo

  def initialize(heads)
    @heads = heads
  end

  def heads
    @heads
  end

  def heads=(value)
    @heads = value
  end

  def set_heads(value)
  end

  def pfff
    self.heads = 10
  end
end

Animal.moo
Animal.new(2).heads # => 2


# => classes-4.rb
