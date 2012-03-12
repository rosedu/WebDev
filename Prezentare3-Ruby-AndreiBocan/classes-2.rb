class Animal
  def initialize(picioare)
    @picioare = picioare
  end

  def scoate_sunet
  end
end


class Caine < Animal
  def initialize(picioare, culoare)
    super(picioare)
    @culoare = culoare
  end

  def self.punem_ciorapei
    "ciorapel ^___^"
  end

  def ham
    "Ciorapel in #{@picioare} de culoare #{@culoare}"
  end
end


p Caine.punem_ciorapei
c = Caine.new(4, "foo")
p c.public_methods - Object.public_methods


# => classes-3.rb
