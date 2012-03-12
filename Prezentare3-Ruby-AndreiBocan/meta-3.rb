def new_class
  a = 1
  Class.new do
    define_method :bar do
      puts "Hello"
    end
  end
end

new_class.new.bar

Cheese = new_class

# => exceptions.rb
