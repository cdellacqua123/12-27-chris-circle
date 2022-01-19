require_relative 'null.rb'
require_relative 'piece.rb'
class Board
    attr_reader :grid

    def initialize
        # @grid = Array.new(3) {Array.new(3)}
        @grid = Array.new(3) {Array.new(3, Null.instance)}
        @grid[0][0] = Piece.new
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        # raises error if start = null piece or off board
        # raises error if end = piece or off board
        # calls move_piece!
        # Can check for self[pos].nil? here, or could refactor & put the check in the [](pos) & []=(pos, val) methods
        # (can be nice if you're checking if a position is on the board in multiple methods)
        raise 'bad start' if self[start_pos].nil? || self[start_pos].symbol == 'null'
        raise 'bad end' if self[end_pos].nil? || self[end_pos].symbol != 'null'
        move_piece!(start_pos, end_pos)
    end

    def move_piece!(start_pos, end_pos)
        # moves piece
        self[end_pos] = self[start_pos]
        self[start_pos] = Null.instance
        # One liner for above 2 lines:
        # self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end

end

