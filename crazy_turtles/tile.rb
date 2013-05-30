module CrazyTurtles

  class Tile

    attr_accessor :tile_setup
    attr_accessor :rotation

    def initialize(tile_setup, rotation = 0)
      self.tile_setup = tile_setup
      self.rotation = rotation
    end

    private

    def rotate(rotation = self.rotation)
      4.times.map do |x|
        tile_setup[(x+rotation) % 4]
      end
    end

  end

end
