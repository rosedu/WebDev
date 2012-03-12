class Animal
  def self.new_from_rat(rat)
    self.new(rat.heads)
  end
  
  def initialize(heads)
    @heads = heads
  end

  def heads; @heads; end
end

Animal.new_from_rat(nil).heads # => 2

# => classes-5.rb
