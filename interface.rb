# frozen_string_literal: true

# require_relative 'resource/card_constants'

# Interface class
class Interface
  GREETING = <<~GREETING
    This is a Blackjack card game. Your goal is to beat a Dealer.

    Each of you have 100$. 10$ are taken from both to the bank each game.
    A winner of that game gets the bank.

  GREETING
  OPTIONS = { '1': :dealer_turn, '2': :open_cards, '3': :take_card }.freeze

  def initialize; end

  def greet
    puts GREETING
  end

  def ask_name
    print 'To start, enter your name: '
    name = gets.chomp
    name.empty? ? 'Nameless' : name
  end

  def ask_another_game
    print 'Do you want to play another game? (y/n): '
    answer = gets.chomp.downcase
    answer == 'y' ? :continue : :finish
  end

  def print_table(dealer:, player:, bank:)
    puts "\n#{bank}$ at stake"
    puts dealer.to_s
    puts player.to_s
  end

  def print_final(dealer:, player:, winner:)
    result = (winner == :tie ? "It's a tie!" : "#{winner.name} won.")
    puts "\n"
    puts dealer.open_cards
    puts player.to_s
    puts result
  end

  def ask_next(have_three: false)
    options = 'You can: 1 (miss your turn) 2 (open cards).'
    options = "#{options} 3 (take a card)." unless have_three
    choice = 0
    until OPTIONS.key?(choice)
      print "#{options} Your choice: "
      choice = gets.chomp.to_sym
      choice = 0 if have_three && choice == :'3'
    end
    OPTIONS[choice]
  end

  def no_deposit
    puts 'No money to stake'
  end
end
