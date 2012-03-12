module Foo
  def self.included(base)
    puts base
  end
end

class Bar
  include Foo
end
