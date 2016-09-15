class Plateau

  attr_reader :x, :y

  def initialize(x, y)

    unless x.is_a? Fixnum  or y.is_a? Fixnum 
      raise ArgumentError, 'Arguments are not numeric'
    end

    if x < 0 or y < 0 
      raise ArgumentError, 'Coordinates must be positive'
    end

    @x = x
    @y = y

  end
end