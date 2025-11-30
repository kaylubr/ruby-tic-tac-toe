require_relative 'Board'
require_relative 'Player'

class GameController
  def initialize
    @board = Board.new
    @player_one = nil
    @player_two = nil
  end

  def ask_name(text)
    print text
    loop do
      name = gets.chomp.capitalize
      return name if name.length > 0
    end
  end

  def start
    puts '=== WELCOME TO TIC TAC TOE ==='
    player_one = Player.create_player(1, 'X')
    player_two2 = Player.create_player(2, 'O')

    current_player = player_one

    board.create_board

    loop do
      puts "\n#{current_player.name}'s turn"
      print 'What row (0-2): '
      row = gets.chomp
      print 'What column? (0-2): '
      column = gets.chomp

      valid = board.play_board(current_player.mark, row, column)

      board.print_board
      
      if board.winner?
        puts "\n#{current_player.name} wins the game."
        break
      elsif board.draw?
        puts "\nDRAW!"
        break
      end

      current_player = current_player == player_one ? player_two2 : player_one if valid
    end
  end

  private 

    attr_accessor :player_one, :player_two
    attr_reader :board

end