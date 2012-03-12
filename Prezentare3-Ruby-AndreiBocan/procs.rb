num = 100

l = lambda do |a,b|
  puts "Hello ruby friends #{a}"
end

p = Proc.new do |a,b|
  puts "Hello ruby friends #{a}"
end

#p l.call 
#p p.call

def awesome(callable)
  callable.call(1,2)
end

def get_a_proc(value)
  Proc.new do
    return value
  end
end

# p get_a_proc(2).call


# => meta.rb
