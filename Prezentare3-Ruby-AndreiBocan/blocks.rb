def foo
  yield
end

foo { "lolz" } # => "lolz"

def double_the_things
  yield * 2
end

double_the_things { "foo " } # => "foo foo "

double_the_things do
  "foo"
end

def optional_block
  if block_given?
    yield
  else
    "I don't like you"
  end
end

optional_block # => "I don't like you"

optional_block { varza; capra; piatra; } # => "Awesome"

# => blocks-2.rb
