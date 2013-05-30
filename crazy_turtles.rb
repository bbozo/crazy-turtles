$LOAD_PATH << '.'

require 'pry'

require 'crazy_turtles/tile'

module CrazyTurtles

  TILES_SETUP = [
    %w(rb gb bh yh),
    %w(bh yb gb yh),
    %w(gb bb bh rh),
    %w(bh gh rb yb),
    %w(yb rh gh bb),
    %w(yb rh gh rb),
    %w(yb rh gh bb),
    %w(gb bh yh bb),
    %w(rh bh gb bb)
  ]

  def self.run
    Tile.new()
  end

end

binding.pry
