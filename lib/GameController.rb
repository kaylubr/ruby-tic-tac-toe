require_relative 'Board'
require_relative 'Player'

class GameController 
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def ask_name(text)
    print text
    loop do
      name = gets.chomp.capitalize
      return name if name.length > 0
    end
  end

  def start
    board.create_board

    puts '=== WELCOME TO TIC TAC TOE ==='
    p1_name = ask_name("\033[1mPlayer 1 Username: ")
    p2_name = ask_name('Player 2 Username: ')

    p1 = Player.new(p1_name, 'X')
    p2 = Player.new(p2_name, '0')

    current_player = p1

    loop do
      board.print_board

      puts "\n#{current_player.name}'s turn"
      print 'What row (0-2): '
      row = gets.chomp
      print 'What column? (0-2): '
      column = gets.chomp

      valid = board.play_board(current_player.mark, row, column)

      if board.draw?
        board.print_board
        puts "\nDRAW!"
        break
      end

      if board.winner?
        board.print_board
        puts "\n#{current_player.name} wins the game."
        break
      end

      current_player = current_player == p1 ? p2 : p1 if valid
    end
  end
end