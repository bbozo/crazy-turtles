module CrazyTurtles

  class Solver

    attr_accessor :tile_setup
    attr_accessor :available_tiles_and_rotations

    def self.run(*args)
      new(*args).run
    end

    def self.results
      @@results ||= []
    end


    def initialize(tile_setup = [], available_tiles_and_rotations = 9.times.map(&:to_i).product(4.times.map(&:to_i)))
      self.tile_setup = tile_setup
      self.available_tiles_and_rotations = available_tiles_and_rotations
    end

    def run
      return unless valid_tile_setup?
      Solver.results << tile_setup and return if at_end?

      available_tiles_and_rotations.each do |tile_and_rotation|
        Solver.run(
          tile_setup + [tile_and_rotation],
          available_tiles_and_rotations.reject{|x| x[0] == tile_and_rotation[0]}
        )
      end
    end

    def valid_tile_setup?
      return true if at_start?

      #binding.pry if tile_setup == [[0, 3], [4, 0], [3, 1], [7, 0]]

      # we only check if last tile is valid, we assume the other runs did their
      # job - this means only left and down needs to be validated
      return false if x(depth-1) > 0 and not current_tile.match?(tile_at(tile_setup[tile_setup.count-2]), :left)
      return false if y(depth-1) > 0 and not current_tile.match?(tile_at(tile_setup[tile_setup.count-4]), :up)

      true
    end


    def depth
      @depth ||= tile_setup.count
    end

    private

    def at_start?
      tile_setup.count <= 1
    end

    def at_end?
      tile_setup.count == 9
    end

    def tile_at tile_and_rotation
      TILES[tile_and_rotation[0]].rotate(tile_and_rotation[1])
    end

    def current_tile
      @current_tile ||= tile_at tile_setup.last
    end

    def x(depth = self.depth)
      @x ||= depth % 3
    end

    def y(depth = self.depth)
      @y ||= depth / 3
    end

  end

end
