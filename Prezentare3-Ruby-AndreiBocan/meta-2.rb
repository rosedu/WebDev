module Doubler
  def double(method_name)
    define_method "double_#{method_name}" do
      self.send(method_name) * 2
    end
  end
end

class Monkey
  extend Doubler
  double :swing
  def swing
    "swing "
  end
end

p Monkey.new.swing
p Monkey.new.double_swing

# => meta-21.rb
