# defining methods


def foo(bar)
  bar * 2
end

# optional returns, optional parens
# last value of the method gets returned, parens can be ommitted

foo(10) # => 20
foo 10  # => 20


def foo bar
  10
end


def foo(cal, vaca = 10, bar = 10)
  return :moo, :val if false
  return :cal
  bar * 2
end

a = 4

#if a == 3
  #p :foo
#elsif a == 2
  #p :bar
#else
  #p :moloz
#end

#case a
  #when 3
    #p :moloz
  #when 2
    #p :etc
  #else
    #p :bla
#end

# puts "foo" unless (a == 3)
a = [1,2,3]

# a = "moloz pe varza"

p a.public_methods.grep /each_/

a.each do |x|
end

a.each {|x|
 # sosoni ;(
} 

# => classes.rb
