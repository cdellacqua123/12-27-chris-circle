require_relative 'card'

class Board
  attr_reader :size, :grid
  
  def initialize(size = 4)
    raise 'Please use even numbers' if !(size % 2 == 0)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
    populate
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def populate
    num_pairs = (size * size) / 2
    
    cards = Card.shuffled_pairs(num_pairs)

    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |spot, spot_idx|
        pos = [row_idx, spot_idx]
        # @grid[row_idx][spot_idx]
        self[pos] = cards.pop
      end
    end
  end
end