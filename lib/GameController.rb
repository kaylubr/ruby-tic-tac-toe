require_relative 'Board'
require_relative 'Player'

class GameController 
  attr_accessor :winner

  def initialize
    @winner = nil
  end

  def start
    board = Board.new
    board.create_board
    
    p1_name = ask_name('Player 1 Username: ')
    p2_name = ask_name('Player 2 Username: ')

    p1 = Player.new(p1_name, 'X')
    p2 = Player.new(p2_name, '0')
  end

  def ask_name(text)
    print text
    loop do
      name = gets.chomp.capitalize
      return name if name.length > 0
    end
  end
end