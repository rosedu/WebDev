class Baz
  extend Bar
end

Baz.bar # => :bar

module Bam
  include Bar
end

class Foot
  include Bam
end

# => enumerable.rb
