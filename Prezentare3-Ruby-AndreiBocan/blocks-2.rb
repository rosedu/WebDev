def block_as_param(&block)
  block.call * 2
end

block_as_param do
  30
end

# => blocks-3.rb
