# Rules of the game
# @lives_player1 = 3
# @lives_player2 = 3
# @lives = [3,3]
# @players = ["", ""]
# @scores = [0,0]
@correct = "Correct!"
@incorrect = "Incorrect!"

def generate_question
  num1 = rand(1..20)
  num2 = rand(1..20)
  operation = "+-*/"
  op = rand(0..3)
  "#{num1} #{operation[op]} #{num2}"
end

def verify_answer(question, answer)
  verify = question.split(' ')
  operation = verify[1]
  num1 = verify[0].to_i
  num2 = verify[2].to_i
  answer == num1.send(operation, num2)
end

def prompt_player_for_answer(player)
  question = generate_question
  puts "#{player} What is #{question}?"
  p = gets.chomp
  verify_answer(question, p.to_i)
end

