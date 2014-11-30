require "pry"

class Board
  WINNING_LINES = [[1,2,3], [4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  def initialize
    @grid = { }
    (1...10).each { | v | @grid[v]  = Square.new(' ') }
  end

  def draw_board
    puts "\e[H\e[2J"
    puts "     |     |"
    puts "  #{@grid[1].grid_value}  |  #{@grid[2].grid_value}  |  #{@grid[3].grid_value} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@grid[4].grid_value}  |  #{@grid[5].grid_value}  |  #{@grid[6].grid_value} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@grid[7].grid_value}  |  #{@grid[8].grid_value}  |  #{@grid[9].grid_value} "
    puts "     |     |"
  end

  def empty_spots?
    empty_spots = [ ]
    empty_spots = @grid.select { |_, square| square.grid_value == ' ' }.values
  end

  def all_squares_marked?
    empty_positions.size == 0
  end

  def empty_positions
    grid = @grid.select { |_, square| square.empty? }.keys
  end

  def mark_square(spot, marker)
    @grid[spot].mark_square(marker)
  end

  def winning_condition?(marker)
    WINNING_LINES.each do |line|
      return true if @grid[line[0]].grid_value== marker && @grid[line[1]].grid_value== marker && @grid[line[2]].grid_value== marker
      end
      false
  end
end

class Player1
  attr_accessor :mark, :name

  def initialize(name, mark)
   @mark = mark
   @name = name
  end
end

class Square
  attr_accessor :grid_value

  def initialize(mark)
    @grid_value = mark
  end

  def mark_square(mark)
    @grid_value = mark
  end

  def occupied?
    @grid_value != ' '
  end

  def empty?
    @grid_value == ' '
  end

end

class Game

  def initialize
    @board1 = Board.new
    @player = Player1.new("Gary", 'X')
    @computer = Player1.new("Computer", 'O')
    @current_player = @player
    @board1.draw_board
  end

  def current_player_marks_square
    if @current_player == @player
      begin
        puts "Choose a position 1-9:"
        position = gets.chomp.to_i
      end until @board1.empty_positions.include?(position)
    else
      position = @board1.empty_positions.sample
    end
    @board1.mark_square(position, @current_player.mark)
  end

  def current_player_win?
    @board1.winning_condition?(@current_player.mark)
  end

  def alternate_player
    if @current_player == @player
      @current_player = @computer
    else
      @current_player = @player
    end
  end

  def play

    @board1.draw_board
    loop do
      current_player_marks_square
      @board1.draw_board
      if current_player_win?
        puts "The winner is #{@current_player.name}!"
        break
      elsif @board1.all_squares_marked?
        puts "It's a tie!"
      else
        alternate_player
      end
    end
  end
end





new_game = Game.new.play


