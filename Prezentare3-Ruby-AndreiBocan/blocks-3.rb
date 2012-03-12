def params_and_blocks(foo)
  foo * yield
end

a = params_and_blocks(30) do |bar|
  10
end # => 300

p a

# => blocks-4.rb
