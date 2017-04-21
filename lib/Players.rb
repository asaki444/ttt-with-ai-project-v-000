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

      board.turn_count <= 5 ? Random.rand(0..9).to_s : self.strategy

    end
 # maybe it would be better to divide this function (strategy -> search_moves + strategy)_Niki
    def search_moves
      self.available_moves = []
      self.pos_taken = []
      self.board.cells.each.with_index do |val,index|
        if val == " "
          self.available_moves << index
        elsif val == self.token
          self.pos_taken << index
        end
      end
       self.available_moves
    end

    def strategy
      move = ""
      def check_for_win
       Game::WIN_COMBINATIONS.detect do |win|
              if win[1] == win[0] &&  board.taken?(win[1])
                move << win[1]
              elsif win[1] == win[2] && board.taken?(win[2])
                move << win[2]
              end
           end
       end
       
       if move == " "
          search_moves.rand
        else
          move
       end
     end
    end

end
