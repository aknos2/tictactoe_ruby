Player = Struct.new(:name, :symbol)

class Players
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = Player.new(player1, 'O')
    @player2 = Player.new(player2, 'X')
  end
end
