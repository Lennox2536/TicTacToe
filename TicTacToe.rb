module TicTacToe
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
    end
  end

  class Player
    def initialize(game)
      @game = game
    end
    def move(field)
      false
    end
  end

end
