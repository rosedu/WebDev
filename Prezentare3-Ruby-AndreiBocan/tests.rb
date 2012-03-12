require 'test/unit'

# http://rubykoans.com/

class AwesomeTest < Test::Unit::TestCase
  def test_this_works
    assert_equal 1, 1
  end

  def test_this_fails
    assert true, "Expected this to not suck"
  end

  def test_this_raises_something
    assert_raises NoMethodError do
      Date.foo
    end
  end
end

# => koans/about_asserts.rb
