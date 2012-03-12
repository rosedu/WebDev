class Bars
  def foo
    throw :bum
  end
end

catch(:done) do
  Bars.new.foo
end

# => tests.rb
