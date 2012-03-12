def foo
  yield :moloz
end

foo do |bar|
  puts bar
end

def foo(&block)
  p block
end

foo do
  puts "Hello"
end

def get_a_proc(&value)
  value
end

get_a_proc do
  puts "10"
  return
end.call

# => procs.rb
