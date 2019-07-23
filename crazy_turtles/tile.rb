module CrazyTurtles

  class Tile < Array

    attr_accessor :tile_setup
    attr_accessor :rotation

    DIRECTIONS = {
      up:    0,
      right: 1,
      down:  2,
      left:  3
    }

    def initialize(tile_setup, rotation = 0)
      super(tile_setup)
      self.rotation = rotation
    end

    def to_tile_array
      rotate(rotation)
    end

    def match?(other_tile, direction)
      direction = make_direction direction

      turtle1 = turtle(direction)
      turtle2 = other_tile.to_tile_array.turtle(direction-2)

      turtle1[0] == turtle2[0] and turtle1[1] != turtle2[1]
    end

    def turtle(direction)
      direction = make_direction direction
      self[direction.modulo 4]
    end

    # 1 - 90 degrees, 2 - 180, 3 - 270
    def rotate(rotate = 0)
      Tile.new(
        4.times.map do |x|
          self[(x-rotate).modulo(4)]
        end
      )
      end

  private

    def make_direction(direction)
      DIRECTIONS[direction] || direction
    end

  end

end
