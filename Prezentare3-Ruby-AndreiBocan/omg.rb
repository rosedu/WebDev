module Bar
  THING = 2
  def foo
    :bar
  end

  def append_features(*args)
    p args
  end
end

class Foo
  include Bar
end
