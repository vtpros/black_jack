# frozen_string_literal: true

# require_relative 'resource/card_constants'

# Interface class
class Interface
  GREETING = <<~GREETING
    This is a Blackjack card game. Your goal is to beat a Dealer.

    Each of you have 100$. 10$ are taken from both to the bank each game.
    A winner of that game gets the bank.

  GREETING

  def initialize; end

  def greet
    puts GREETING
  end

  def ask_name
    print 'To start, enter your name: '
    name = gets.chomp
    name.empty? ? 'Nameless' : name
  end

  def print_table(dealer:, player:, bank:)
    puts "\nAt stake: #{bank}$"
    puts dealer.to_s
    puts player.to_s
  end

  def print_options
    choice = 0
    until (1..3).include?(choice)
      puts 'You can: 1 (open cards) 2 (take a card) 3 (miss turn)'
      print 'Your choice: '
      choice = gets.to_i
    end
    choice
  end
end
