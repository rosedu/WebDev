class Foo
  attr_accessor :bar
end

def pick
  p self
end

def moo
  puts @bar
  puts self
end

bar = lambda do
  @bar
end

a = Foo.new
a.bar = 10

method(:moo).unbind.bind(a)
a.send(:moo)

p self
