require_relative 'Cell'

class Board
  attr_accessor :game_board

  def initialize
    @game_board = []
  end

  def create_board
    3.times do
      row = []
      3.times do
        row << Cell.new(' ')
      end
      game_board << row
    end
  end

  def print_board
    game_board.each_with_index do |col, col_idx|
      col.each_with_index do |cell, cell_idx|
        if cell_idx == 1
          print "| #{cell.mark} |"
        else
          print " #{cell.mark} "
        end
      end
      puts "\n---+---+---" unless col_idx == 2
    end
    puts "\n"
  end
end