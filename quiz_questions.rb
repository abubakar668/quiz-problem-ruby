# frozen_string_literal:true

require 'csv'
require 'timeout'

# Ask questions and calculate result
class Quiz
  include Timeout
  def initialize
    @correct = 0
    @incorrect = 0
  end

  def ask_questions
    data = CSV.read('problems.csv')
    data.each do |question, answer|
      puts "Answer this: #{question}"
      ans = gets.chomp.to_i
      answer = answer.to_i
      ans == answer ? @correct += 1 : @incorrect += 1
    end
  end

  def show_result
    puts "\nTotal Questions: #{@correct.to_i + @incorrect.to_i}"
    puts "Correct answers: #{@correct}"
    puts "Incorrect answers: #{@incorrect}"
  end

  def start(timeout_time)
    puts 'Lets start the quiz'
    begin
      Timeout.timeout(timeout_time) { ask_questions }
    rescue Timeout::Error
      puts "\nTime is Up!"
    ensure
      show_result
    end
  end
end
