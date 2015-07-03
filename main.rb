# Play Game

require "./rules.rb"
require "colored"

puts "Player 1: "
@players[0] = gets.chomp
puts "Player 2: "
@players[1] = gets.chomp

current_player = 0
play_again = ""

while play_again.downcase != "no"
  while @lives[0] != 0 && @lives[1] != 0 do
    if prompt_player_for_answer(@players[current_player % 2])
      puts "#{@correct}".green
      @scores[current_player % 2] += 1
    else
      puts "#{@incorrect}".red
      @lives[current_player % 2] -= 1
    end
    current_player += 1
  end
  puts "Do you want to play again? (yes/no)"
  play_again = gets.chomp
  current_player = (current_player + 1) % 2
  @scores[current_player] += 1
end

puts "#{@players[(current_player % 2) + 1]} your score is #{@scores[current_player]}"