require_relative 'TicTacToe'

class ConsoleGame
  def initialize
    @game = TicTacToe::Game.new
    @player = TicTacToe::Player.new(@game)
    @computer = TicTacToe::Player.new(@game)
  end

  def start!
    @game.start!
  end

  def print_board
    (0..2).each do |row|
      (0..2).each {|column| puts @game.board[3*row + column]}
      puts
    end
  end

  def game_loop
    while @game.running

    end
  end
end
