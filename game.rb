# frozen_string_literal: true

require_relative 'interface'
require_relative 'dealer'
require_relative 'player'

# Game class
class Game
  STAKE_SUM = 10

  def initialize
    @interface = Interface.new
    @dealer = Dealer.new
    @player = nil
    @bank = 0
  end

  def start
    interface.greet
    self.player = Player.new(name: interface.ask_name)
    initial_deal
    cycle
  end

  private

  attr_accessor :player, :bank
  attr_reader :dealer, :interface

  def initial_deal
    reset_game
    2.times do
      player.recieve_card(dealer.deal_card)
      dealer.recieve_card(dealer.deal_card)
    end
  end

  def cycle
    loop do
      interface.print_table(dealer: dealer, player: player, bank: bank)
      choice = interface.ask_next(have_three: three?(player))
      result = send(choice)
      dealer_turn if result == :dealer_turn
      break if break?(result)

      result = open_cards if three_both?
      break if break?(result)

      initial_deal if result == :continue
    end
  end

  def reset_game
    self.bank += (player.stake(STAKE_SUM) + dealer.stake(STAKE_SUM))
    player.reset
    dealer.reset
    dealer.new_deck
  end

  def take_card
    player.recieve_card(dealer.deal_card)
    :dealer_turn
  end

  def dealer_turn
    dealer.recieve_card(dealer.deal_card) if dealer.points < 17 && !three?(dealer)
  end

  def open_cards
    winner = end_game
    interface.print_final(dealer: dealer, player: player, winner: winner)
    interface.ask_another_game
  end

  def end_game
    winner = self.winner
    winner == :tie ? tie : winner.receive_money(bank)
    @bank = 0
    winner
  end

  def winner
    d_max_out = dealer.points > MAX_POINTS
    p_max_out = player.points > MAX_POINTS
    return :tie if dealer.points == player.points || (d_max_out && p_max_out)
    return player if d_max_out
    return dealer if p_max_out

    dealer.points > player.points ? dealer : player
  end

  def tie
    dealer.receive_money(STAKE_SUM)
    player.receive_money(STAKE_SUM)
  end

  def three?(player)
    player.num_cards == 3
  end

  def three_both?
    three?(player) && three?(dealer)
  end

  def no_deposit?
    player.deposit.zero? || dealer.deposit.zero?
  end

  def break?(result)
    result == :finish || no_deposit?
  end
end
