module TicTacToe
  WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  class Game
    def initialize
      @board = Array.new(9)
      @running = false
      @current_player_id = 0
    end

    def free?(field)
      !@board[field]
    end

    def move!(field)
      @board[field] = @current_player_id
      switch_players!
    end

    def board
      @board
    end

    def switch_players!
      @current_player_id = other_player
    end

    def other_player
      1 - @current_player_id
    end

    def start!
      @running = true
      clear_board!
    end

    def clear_board!
      @board.fill(nil)
    end

    def winning?
      WINNING_COMBINATIONS.any? do |combination|
        combination.all? {|field| @board[field] == @current_player_id}
      end
    end
  end

  class Player
    def initialize(game)
      @game = game
    end

    def move(field)
      if (@game.free? field) && (field < 9)
        @game.move!(field)
        true
      else
        false
      end
    end
  end

end
