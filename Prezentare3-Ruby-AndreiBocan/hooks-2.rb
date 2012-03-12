class Foo
  def self.inherited(base)
    p base
  end
end

class Bar < Foo
end

# => hooks-3.rb
