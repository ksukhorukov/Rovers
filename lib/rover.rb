class Rover

  attr_reader :x, :y, :direction

  def initialize(map, x, y, direction)

    unless map.is_a? Plateau
      raise 'Please provide a valid map for the rover'
    end

    unless x.is_a? Fixnum  or y.is_a? Fixnum 
      raise 'Arguments are not numeric'
    end

    unless ['N', 'S', 'E', 'W'].include? direction
      raise "Direction can be 'N', 'S', 'E' or 'W' which stands for 'North', 'South', 'East' or 'West'"
    end

    if x < 0 or y < 0
      raise 'Coordinates must be positive'
    end

    if x > map.x or y > map.y
      raise 'You are landing out of plateau'
    end

    @x = x
    @y = y
    @map = map
    @direction = direction

  end

  def move(step) # L, R, M

    if step == 'L'
      if @direction == 'N'
        @x -= 1
        @direction = 'W'
      elsif @direction == 'S'
        @x += 1
        @direction = 'E'
      elsif @direction == 'W'
        @y -= 1
        @direction = 'S'
      elsif @direction == 'E'
        @y += 1
        @direction = 'N'
      end
    elsif step == 'R'
      if @direction == 'N'
        @x += 1
        @direction = 'E'
      elsif @direction == 'S'
        @x -= 1
        @direction = 'W'
      elsif @direction == 'W'
        @y += 1
        @direction = 'N'
      elsif @direction == 'E'
        @y -= 1
        @direction = 'S'
      end
    elsif step == 'M'
      if @direction == 'N'
        @y += 1
      elsif @direction == 'S'
        @y -= 1
      elsif @direction == 'W'
        @x -= 1
      elsif @direction == 'E'
        @x += 1
      end 
    end
  end

  def inspect
    @x.to_s + ' ' + @y.to_s + ' ' + @direction
  end

  def to_s
    inspect
  end

end