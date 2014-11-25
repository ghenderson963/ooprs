
require "pry"
class GamePiece
  attr_accessor :type

  def initialize(type)
    self.type = type
  end
end

class Player
  attr_accessor :name, :player_choice

  def initialize(name)
    self.name = name
    self.player_choice = ' '
  end

  def ask_choice
    begin
      puts "Choose one: (P/R/S)"
      self.player_choice = gets.chomp.downcase
    end until (player_choice == "p") || (player_choice == "r") || (player_choice ==  "s")
  end

  def choice(choice)
    self.player_choice = choice
    puts "#{name} picked #{player_choice}"
  end
end

class Computer < Player
  attr_accessor :name

  def initialize
    self.name = "Robbie the Robot"
     self.player_choice = ['r', 'p', 's'].sample
  end

end


class GameEngine

  def welcome
    puts "Play Paper Rock Scissors!"
  end

  def ask_choice
    puts "Choose one: (P/R/S)"
  end

  def play
    puts "What is your name?"
    players_name = gets.chomp
    player1 = Player.new(players_name)
    computer1 = Computer.new
    player1.ask_choice
    player_choice = player1.player_choice
    computer_choice = computer1.player_choice
    binding.pry
    compare_choices(player_choice, computer_choice)
  end

  def compare_choices(you, computer)
    if (computer == "p") && (you == "s")
      puts "Scissors cut Rock"
      puts "You win!"
      puts ""
    elsif (computer == "s") && (you == "s")
      puts "Scissors and Scissors tie"
      puts "It's a tie!"
      puts ""
    elsif (computer =="r") && (you == "s")
      puts "Rock crushes Scissors"
      puts "Computer wins!"
      puts ""
    elsif (computer == "p") && (you == "p")
      puts "Paper and Paper "
      puts "It's a tie!"
    elsif (computer == "s") && (you == "p")
      puts "Scissors cut Paper"
      puts "Computer wins!"
    elsif (computer == "r")  && (you == "p")
      puts "Paper wraps Rock"
      puts "You win!"
    elsif (computer == "p") && (you == "r")
      puts "Paper wraps rock"
      puts "Computer wins!"
    elsif (computer == "s") && (you == "r")
      puts "Rock crushes Scissors"
      puts "You win!"
    else (computer == "r") && (you == "r")
      puts "Rock and Rock"
      puts "It's a tie!"
    end
  end
end

game1 = GameEngine.new
game1.play




