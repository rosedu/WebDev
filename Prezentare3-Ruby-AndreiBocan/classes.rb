class Vaca

  def initialize()
    @numar_picioare = nume
  end

  def bar
    @bar = 2
    uger
  end

protected
  def moo
    :bar
  end

private
  def uger
  end

end

a = Vaca.new

p a.bar


# => classes-2.rb
