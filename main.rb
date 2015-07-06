# Play Game
require "./rules.rb"
require "colored"


class Player
  attr_accessor :name, :lives, :score

  def initialize(name, lives, score)
    @name = name
    @lives = lives
    @score = score
  end

  def lose_a_life
    @lives -= 1
  end

  def won
    @score += 1
  end

  def lives_reset
    @lives = 3
  end
end

puts "Player 1: "
p1 = gets.chomp
puts "Player 2: "
p2 = gets.chomp

player1 = Player.new(p1, 3, 0)
player2 = Player.new(p2, 3, 0)

# @current_player = 0
play_again = "yes"
current_player = 0

while play_again.downcase != 'no'
  while player1.lives > 0 && player2.lives > 0
    if current_player % 2 == 0
      if prompt_player_for_answer(player1.name)
        puts "#{@correct}".green
        player1.won
      else
        puts "#{@incorrect}".red
        player1.lose_a_life
      end
    else
      if prompt_player_for_answer(player2.name)
        puts "#{@correct}".green
        player2.won
      else
        puts "#{@incorrect}".red
        player2.lose_a_life
      end
    end
    current_player += 1
  end
  puts "Do you want to play again? (yes/no)"
  play_again = gets.chomp
  player1.lives_reset
  player2.lives_reset
end

if player1.score == player2.score
  puts "It\'s a tie!"
elsif player1.score > player2.score
  puts "#{player1.name} you are the winner by a whopping #{player1.score - player2.score} points!"
else
  puts "#{player2.name} you are the winner by a whopping #{player2.score - player1.score} points!"
end
# def game
#   while @lives[0] != 0 && @lives[1] != 0 do
#     if prompt_player_for_answer(@players[@current_player % 2])
#       puts "#{@correct}".green
#       # @scores[@current_player % 2] += 1
#     else
#       puts "#{@incorrect}".red
#       @lives[@current_player % 2] -= 1
#     end
#     @current_player += 1
#   end
# end
# while @play_again.downcase != "no"
#   # @lives = [3,3]
#   if @play_again.downcase == "yes"
#     game
#   end
#   puts "Do you want to play again? (yes/no)"
#   @play_again = gets.chomp
  
# # else
  
# end
# @current_player = (@current_player + 1) % 2
# @scores[@current_player] += 1

# if @players[@current_player] == @players[(@current_player + 1) % 2]
#   puts "It\'s a tie!"
# else
#   puts "#{@players[@current_player]} your score is #{@scores[@current_player]}"
# end


