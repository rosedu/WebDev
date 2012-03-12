class Bar < Exception
  def raise
    raise self
  end
end


# raise Bar.new('Fuck this shit')
#
# => catch.rb
