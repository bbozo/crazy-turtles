$LOAD_PATH << '.'

require 'pry'

require 'crazy_turtles/tile'
require 'crazy_turtles/solver'

module CrazyTurtles

  TILES_SETUP = [
    %w(rb gb bh yh), # 0
    %w(bh yb gb rh), # 1
    %w(gb bb bh rh), # 2
    %w(bh gh rb yb), # 3
    %w(yb rh gh bb), # 4
    %w(yb rh gh rb), # 5
    %w(yb rh gh bb), # 6
    %w(gb bh yh bb), # 7
    %w(rh bh gb bb)  # 8
  ]

  TILES = TILES_SETUP.map{ |x| Tile.new(x) }

end

CrazyTurtles::Solver.run

binding.pry
