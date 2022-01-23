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
    puts "----+---+----"
    (0..2).each do |row|
      (0..2).each {|column| print_field(3*row + column)}
      puts "|\n----+---+----"
    end
  end

  def game_loop
    while @game.running
      player_move
      bot_move unless @game.winner
    end
  end

  def player_move
    puts "Choose place to go"
    print_board
    field = gets.to_i
    @player.move field
  end

  def print_field(field)
    if @game.board[field]
      sign = @game.board[field] == 0 ? "X" : "0"
    else
      sign = " "
    end
    print "| #{sign} "
  end

  def win_message
    puts "YOU WON!"
    print_board
  end

  def bot_move
    @computer.move first_free
  end

  def first_free
    @game.board.index(false)
  end
end
