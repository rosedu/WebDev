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

# => meta-1.rb
