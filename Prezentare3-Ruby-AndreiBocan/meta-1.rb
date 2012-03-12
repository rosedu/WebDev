# method missing!
#
class RespondsToEverything
  def method_missing(method, *args)
    puts "Got a #{method} with #{args.inspect}"
  end
end

a = RespondsToEverything.new
a.foo
a.bar(10)
a.baz(:buz)


# but does it actually respond to that ?
p a.respond_to? :foo

class RespondsToEverything
  def respond_to?(method)
    if [:foo, :bar].include? method
      true
    else
      super
    end
  end
end

p a.respond_to? :foo
p a.respond_to? :rabbit_on_a_stick

# => meta-2.rb
