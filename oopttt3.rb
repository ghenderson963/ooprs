require "pry"

class Board
  WINNING_LINES = [[1,2,3], [4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  def initialize
    @grid = {}
    (1..9).each { |square| @grid[square] = Square.new(" ")}
  end

  def draw_board
    puts "\e[H\e[2J"
    puts "     |     |"
    puts "  #{@grid[1]}  |  #{@grid[2]}  |  #{@grid[3]} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@grid[4]}  |  #{@grid[5]}  |  #{@grid[6]} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@grid[7]}  |  #{@grid[8]}  |  #{@grid[9]} "
    puts "     |     |"
  end

  def empty?(square_number)
    @grid[square_number]
  end

  def empty_squares?
    @grid.select { |_ ,square| square.value == " " }.keys
  end

def mark_square(choice, marker)
  @grid[choice].value = "#{marker}"
end

def squares_all_played?
  @grid.select { |_, square| square.empty? }.count == 0
end

  def winning_condition?(marker)
    WINNING_LINES.each do |line|
      return true if @grid[line[0]].value== marker && @grid[line[1]].value== marker && @grid[line[2]].value== marker
      end
      false
  end
end

class Square
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def empty?
    @value == " "
  end

  def not_empty?
    @value != " "
  end

  def to_s
    value
  end
end


class Player
  attr_reader :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def to_s
    @name
  end
end


class Game
  def initialize
    @human = Player.new("Gary", 'X')
    @computer = Player.new("Overlord", 'O')
    @board = Board.new
    @player = @human
  end

  def play
    @player = who_goes_first
    puts "#{@player} goes first!"
    begin
      @board.draw_board
      if @player == @human
        human_turn
        if @board.winning_condition?(@human.marker)
        puts "You win!"
        break
        end
      else
        computer_turn
        if @board.winning_condition?(@computer.marker)
          puts "computer wins!"
          break
        end
      end
    switch_user_turn(@player)
    end until @board.squares_all_played?
    if @board.squares_all_played?
      puts "It's a tie!"
    else
    end
  end

  def who_goes_first
    [@human,@computer].sample
  end

  def check_user_input(player_choice)
      if player_choice.to_i == 0
        puts "Enter an number 1 - 9"
      elsif !@board.empty_squares?.include?(player_choice)
        puts "Please choose a square that isn't occupied!"
      else
        return true
      end
    end

  def human_turn
    begin
      puts "Choose a square (1-9) #{@human}"
      choice = gets.chomp.to_i
    end until check_user_input(choice)
    @board.mark_square(choice, @human.marker)
  end

  def computer_turn
    computer_choice = @board.empty_squares?.sample
    @board.mark_square(computer_choice, @computer.marker)
  end

  def switch_user_turn(player)
    if @player == @human
      @player = @computer
    else
      @player = @human
    end
  end
end

game = Game.new.play

