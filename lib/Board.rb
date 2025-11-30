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
    puts "\n"
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

  def valid?(row, col)
    range = (0..2)
    return false if row.length > 1 && col.length > 1
    return false unless range.include?(row.to_i) && range.include?(col.to_i)
    game_board[row.to_i][col.to_i].mark.eql?(' ')
  end

  def play_board(mark, row, col)
    if valid?(row, col)
      game_board[row.to_i][col.to_i].mark = mark
      return true
    end

    puts "\n⚠ INVALID MOVE ⚠"
    return false
  end
end