class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def self.create_player(num, mark)
    print "\033[1m"
    print "Player #{num} username: "
    loop do
      name = gets.chomp.capitalize
      return Player.new(name, mark) if name.length > 0
    end
  end
end