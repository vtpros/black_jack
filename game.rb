# frozen_string_literal: true

require_relative 'interface'
require_relative 'dealer'
require_relative 'player'

# Game class
class Game
  STAKE_SUM = 10
  #CHOICE = {
  #  0: :exit,
  #  1: :get_card,
  #  2: :nada
  #}

  def initialize
    @interface = Interface.new
    @dealer = Dealer.new
    @player = nil
    @bank = 0
  end

  def start
    interface.greet
    self.player = Player.new(name: interface.ask_name)
    self.bank += (player.stake(STAKE_SUM) + dealer.stake(STAKE_SUM))
    initial_deal
    cycle
  end

  private

  attr_accessor :player, :bank
  attr_reader :dealer, :interface

  def initial_deal
    2.times do
      player.recieve_card(dealer.deal_card)
      dealer.recieve_card(dealer.deal_card)
    end
  end

  def cycle
    loop do
      interface.print_table(dealer: dealer, player: player, bank: bank)
      choice = gets.chomp
      break if choice == '0'
    end
  end

  def player_turn
    choice = interface.print_options
    choice
  end

  def dealer_turn
    # to do
  end

  def three_cards_each?
    player.num_cards == 3 && dealer.num_cards == 3
  end
end
