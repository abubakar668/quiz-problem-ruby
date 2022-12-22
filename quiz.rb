# frozen_string_literal:true

require_relative 'quiz_questions'

puts 'QUIZ PROBLEM'
puts 'Total time for quiz is 30 seconds. Select 0 to accept and 1 to change the time(sec):'
select_time = gets.chomp.to_i
case select_time
when 0
  Quiz.new.start(30)
when 1
  puts 'Give the time to update(sec):'
  Quiz.new.start(gets.chomp.to_i)
else
  puts 'Invalid input'
end
