#tick tack toe is a game where 2 players take turn selecting squares on a board.  The goal is to fill up either a straight or diagaonal line with either x or o.




class Board
  attr_accessor :game_board

  def initialize
    self.game_board = ["Do_Not_Use"," "," "," "," "," "," "," "," "," "]
  end

  def check_input(choice, piece)
      if game_board[choice] != " "
        puts "Please select an open Square"
        player1.user_choice
      elsif
        self.game_board[choice] = "#{piece}"
      end
    end

  def draw_game_board
    puts "\e[H\e[2J"
    puts "     |     |"
    puts "  #{self.game_board[1]}  |  #{self.game_board[2]}  |  #{self.game_board[3]} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{self.game_board[4]}  |  #{self.game_board[5]}  |  #{self.game_board[6]} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{self.game_board[7]}  |  #{self.game_board[8]}  |  #{self.game_board[9]} "
    puts "     |     |"
  end
end

class Player

  def initialize

  end
  def user_choice
    begin
    begin
      puts "Choose a position (1 to 9) to place your X"
      user_choice = gets.chomp.to_i
    end while user_choice == 0
  end while board1.check_input(user_choice, 'X')  == 0



    #game_board[user_choice] = "X"

end


private

  def check_user_input(user_choice, game_board)
    if game_board[user_choice] != " "
      puts "Please select an open Square"
      user_choice(game_board)
    end
  end
end
#pieces

class Computer < Player

end

class Game
  board1 = Board.new
  player1 = Player.new
  computer1 = Computer.new
  board1.draw_game_board
  player1.user_choice
end

