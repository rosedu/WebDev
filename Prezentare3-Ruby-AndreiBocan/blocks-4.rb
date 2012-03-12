def can_yield_a_value
  yield 40
end

can_yield_a_value do |x|
  x == 40
end # => true

y = 20

can_yield_a_value do |x|
  y * 2 == x
end # => true

# => modules.rb
