class Board
  attr_reader :board

  def initialize
    @board = Array.new(9, '')
  end

  def update_board(index, value)
    @board[index] = value
    display_board
  end

  def display_board
    visual = @board.map.with_index do |cell, index|
      cell.empty? ? (index + 1).to_s : cell
    end

    puts visual.each_slice(3).map { |row| row.join(' | ') }.join("\n---------\n")
  end
end
