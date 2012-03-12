module Bar
  def initialize(omg)
    puts "ZOMG"
  end
end

class Baz
  include Bar
  def initialize(omg)
    if omg.is_a? Hash
      super(omg)
    else
      puts "WTF"
    end
  end
end


p Baz.new([])
p Baz.new({})
