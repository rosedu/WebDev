class PhonyArray
  def initialize(min, max, step)
    @max = max
    @min = min
    @step = step
  end

  def each
    a = @min
    while a < @max do
      yield a
      a += @step
    end
  end
end

# => procs-blocks.rb
