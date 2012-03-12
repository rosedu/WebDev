module Incrementer
  a = 0
  define_method(:increment) do
    a += 1
  end
end

class Food
  include Incrementer
end

class Drink
  include Incrementer
end

p Food.new.increment
p Food.new.increment
p Food.new.increment
p Food.new.increment
p Drink.new.increment
p Drink.new.increment
p Drink.new.increment
p Drink.new.increment

# => meta-3.rb
