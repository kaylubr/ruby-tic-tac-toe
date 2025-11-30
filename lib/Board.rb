require_relative 'Cell'

class Board
  attr_accessor :game_board

  def initialize
    @game_board = []
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

  def create_board
    3.times do
      row = []
      3.times do
        row << Cell.new(' ')
      end
      game_board << row
    end
    print_board
  end


  def valid?(row, col)
    range = (0..2)
    return false if row.length > 1 && col.length > 1
    return false unless range.include?(row.to_i) && range.include?(col.to_i)
    game_board[row.to_i][col.to_i].mark.eql?(' ')
  end

  def draw?
    board = game_board.flatten
    board.each { |cell| return false if cell.mark.eql?(' ')}
    true
  end

  def play_board(mark, row, col)
    if valid?(row, col)
      game_board[row.to_i][col.to_i].mark = mark
      return true
    end
    puts "\n⚠ INVALID MOVE ⚠"
    false
  end

  def winner?()
    win_combinations = [
      [0, 1, 2], 
      [3, 4, 5], 
      [6, 7, 8], 
      [0, 3, 6], 
      [1, 4, 7], 
      [2, 5, 8], 
      [0, 4, 8], 
      [2, 4, 6]  
    ]
    board = game_board.flatten
    win_combinations.each do |pattern|
      next if board[pattern[0]].mark.eql?(' ') || board[pattern[1]].mark.eql?(' ') || board[pattern[2]].mark.eql?(' ')
      if board[pattern[0]].mark.eql?(board[pattern[1]].mark) && board[pattern[1]].mark.eql?(board[pattern[2]].mark)
        return true
      end
    end
    false
  end
end