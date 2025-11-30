require_relative 'Cell'

class Board
  attr_accessor :game_board

  def initialize
    @game_board = []
  end

  def create_board
    3.times do
      3.times do
        game_board << [Cell.new('O')]
      end
    end
  end
end