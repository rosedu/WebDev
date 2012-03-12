class Foo
  def self.method_added(method)
    original_method = "original_#{method}".to_sym
    puts method
    return if @mirror

    @mirror = true
    send(:alias_method, original_method, method) 
    puts "Defining #{original_method}"
    define_method method do |*args|
      puts "#{method}'s mom dresses him funny"
      send(original_method, args)
    end
    @mirror = nil
  end

  def self.instance_method_added
  end

  def foo(bar)
    puts "#{bar} times"
  end

  def self.foo
  end
end

Foo.new.foo(2)

# => hooks-2.rb
