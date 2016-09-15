require 'spec_helper'
require_relative '../lib/plateau'

describe "Plateau" do 
  let(:map) { Plateau.new(5,5) }

  it "can be possible to read attributes of the map" do
    expect(map.x).to eq(5)
    expect(map.y).to eq(5)
  end

  it "is possible to pass only integers as coordinates" do
    expect { Plateau.new('10', '10') }.to raise_error
  end

  it "is possible to pass only positive integers as coordinates" do
    expect { Plateau.new(-10, -10) }.to raise_error
  end

end