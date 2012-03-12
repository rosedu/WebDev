1 # an integer
# p 1.public_methods

MOLOZ = 123
p MOLOZ.to_s
:foo # a symbol
#foo
p :foo.to_s

p 1.to_s.to_sym.public_methods

['an', 'array']
[1,2,3,4]
p [1,2,"foo", :bar]
%w(an array)
%w(foo bar baz)
"123foo".to_i
%x{ls}

#puts nil
#p "Foo bar baz      "

a = { :foo => "bar" } # a hash
#p a[:foo] * 2
#p a[:bar] * 2
a["foo"] = :bar
a[1] = Fixnum
1.class

p (1..10).include?(3) # range

# foo 
=begin
comments
=end

# and some more comments


# => intro-3.rb
