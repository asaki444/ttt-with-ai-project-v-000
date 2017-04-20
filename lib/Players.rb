require 'pry'
class Players
  class Human < Player
    def move(board)
      gets.chomp
    end
  end

  class Computer < Player
    attr_accessor :available_moves, :pos_taken, :board

      def move(board)
        #we can access to this board in any function with self.board_Niki
        @board = board
        board.turn_count <= 4 ? Random.rand(0..9).to_s : self.strategy.to_s
        end
 # maybe it would be better to divide this function (strategy -> search_moves + strategy)_Niki
    def search_moves
      @available_moves = []
      @pos_taken = []
      board.cells.each.with_index do |val,index|
        if val == " "
          self.available_moves << index
        elsif val == self.token
          self.pos_taken << index
        end
      end
    end

    def strategy
      i = 0
      move = ""
      def win
        Game::WIN_COMBINATIONS.each do |win_combination|
          array = win_combination.find_all{|x| x == token}
             if array.size == 2
              move  << win_combination.reject{|x| x == array[0] || x == array[1] || x == array [2]}.to_s
            end
          end
        move
      end
        if win(self.token) == " "
            win("other players token")
        else
          win
        end

        # win_combination.detect do |win_index|
        #  #checks for the position taken of the opponent and the computer
        #  #blocks if it is about to win
        # end
        # win_combination.detect.with_index do |x,i|
        #   if x == self.token && @available_moves.include?(i+2) && board.cells[i+1] == self.token
        #       i+1
        #   elsif x == self.token && @available_moves.include?(i+1) && board.cells[i+2] == self.token
        #       i+2
        #   end
        #   #wouldnt a nested detect would give us a single index at a time. so I just compared x to the token, and asked if the spot is available.

       end
    end
        #i want to use the WIN_COMBINATIONS array to detect our next best move to win.
        #checking if the token is occupying two out of three winning spots, and hopefully returning the move

        #I think we should use yield twice because the WIN_COMBINATIONS is nested array. However, the IDEA is GREAT! _Niki

  #binding.pry


end
