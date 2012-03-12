a = %w(lapte carne oua)

p a.map { |ce| "Cafea cu #{ce}" }

r = a.inject do |acc, item|
  "#{item} - #{acc}"
end

puts r

r = [1,2,3].inject(0) do |acc, item|
  acc += item
end

puts r

# => enumerable-3.rb
