module Bar
  def bar
    :bar
  end
end

class Foo
  include Bar
end

Foo.new.bar # => :bar

# => modules-2.rb
