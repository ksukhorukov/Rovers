require 'spec_helper'
require_relative '../lib/plateau'
require_relative '../lib/rover'

describe "Rover" do 
  let(:map) { Plateau.new(5,5) }

  it "can be possible to get coordinates and direction of a rover" do
    rover = Rover.new(map, 1, 2, 'N')
    expect(rover.x).to eq(1)
    expect(rover.y).to eq(2)
    expect(rover.direction).to eq('N')
  end

  it "can be possible to move a rover to the left" do 
    rover = Rover.new(map, 1, 2, 'N')
    rover.move('L')
    expect(rover.x).to eq(0)
    expect(rover.direction).to eq('W')
  end

  it "can be possible to move a rover to the right" do 
    rover = Rover.new(map, 1, 2, 'N')
    rover.move('R')
    expect(rover.x).to eq(2)
    expect(rover.direction).to eq('E')
  end

  it "can be possible to move a rover straight ahead" do 
    rover = Rover.new(map, 1, 2, 'N')
    rover.move('M')
    expect(rover.y).to eq(3)
    expect(rover.direction).to eq('N')
  end

  it "is not possible to initialize a rover with a wrong map" do 
    wrong_map = Array.new
    expect { (Rover.new(wrong_map, 1, 2, 'N')) }.to raise_error
  end

  it "is not possible to initialize a rover with a negative coordinates" do 
    expect { Rover.new(map, -1, -2, 'N') }.to raise_error
  end

  it "is not possible to initialize a rover with coordinates other than numerical" do 
    expect { Rover.new(map, '1', '2', 'N') }.to raise_error
  end

  it "is not possible to initialize a rover with a wrong direction" do 
    expect { Rover.new(map, 1, 2, 'X') }.to raise_error
  end

  it "is not possible to initialize a rover with coordinates out of map" do 
    expect { Rover.new(map, 10, 10, 'N') }.to raise_error
  end

end