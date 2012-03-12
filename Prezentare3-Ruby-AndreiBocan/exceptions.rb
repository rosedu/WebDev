def divide_by(num)
  1/num
rescue ZeroDivisionError, TypeError => e
  puts "Stop right there, criminal scum!"
  num = 1
  retry
rescue TypeError => e
  puts "Shit won't work, bro"
ensure
  puts "Lol division!"
end

p divide_by(0)
p divide_by(2)

p divide_by("hello")

# => exceptions-2.rb
