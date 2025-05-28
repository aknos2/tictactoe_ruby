require_relative 'lib/board'
require_relative 'lib/players'
require_relative 'lib/rules'

class Game
  def initialize
    @board = Board.new
    @players = Players.new('Player 1', 'Player 2')
    @rules = Rules.new
    @current_player = @players.player1
  end

  def play
    puts 'Welcome to Tic-Tac-Toe!'
    show_board

    loop do
      handle_turn
      break if game_over?

      switch_player
    end
  end

  def show_board
    @board.display_board
  end

  private

  def handle_turn
    input = player_input
    if valid_move?(input)
      @board.update_board(input, @current_player.symbol)
    else
      puts 'Invalid move. Try again.'
      handle_turn
    end
  end

  def player_input
    puts "#{@current_player.name}'s turn (#{@current_player.symbol}). Choose a position (1–9):"
    gets.chomp.to_i - 1 # Subtract 1 because index starts at 1 in the board
  end

  def valid_move?(index)
    index.between?(0, 8) && @board.board[index].empty?
  end

  def switch_player
    @current_player = @current_player == @players.player1 ? @players.player2 : @players.player1
  end

  def game_over?
    if @rules.winner?(@board.board, @current_player.symbol)
      puts "🎉 #{@current_player.name} wins!"
      true
    elsif @rules.draw?(@board.board)
      puts "🤝 It's a draw!"
      true
    else
      false
    end
  end
end

game = Game.new
game.play
