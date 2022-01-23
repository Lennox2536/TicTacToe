require_relative 'TicTacToe'

class ConsoleGame
  def initialize
    @game = TicTacToe::Game.new
    @player = TicTacToe::Player.new(@game)
    @computer = TicTacToe::Player.new(@game)
  end

  def print_board
    puts "----+---+----"
    (0..2).each do |row|
      (0..2).each {|column| print_field(3*row + column)}
      puts "|\n----+---+----"
    end
  end

  def start_game
    @game.start!
    while @game.running
      player_move
      bot_move unless @game.winner
    end
    print_board
    puts end_message
  end

  def player_move
    begin
      print_board
      puts "Choose place to go"
      field = gets.to_i
    end until @player.move field
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
  end

  def bot_move
    @computer.move first_free if first_free
  end

  def first_free
    @game.board.index(false)
  end

  def end_message
    if @game.winner
      @game.winner == 0 ? "YOU WON! :)" : "COMPUTER WON! :("
    else
      "It's a tie."
    end
  end
end
