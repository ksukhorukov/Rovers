#!/usr/bin/env ruby

require './lib/rover'
require './lib/plateau'

data = File.readlines(ARGV[0]).map(&:strip).reject(&:empty?)
x, y = data.shift.split(' ').map(&:to_i)
map = Plateau.new(x, y)
(0..data.length-1).step(2).each do |index|
  x, y, direction = data[index].split(' ')
  moves = data[index+1].split('')
  rover = Rover.new(map, x.to_i, y.to_i, direction)
  moves.each do |move| 
    rover.move(move)
  end
  puts rover
end
