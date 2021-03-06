# frozen_string_literal: true

require_relative 'deck'
require_relative 'resource/players'

# Dealer class
class Dealer
  include Players

  def initialize
    @name = 'Dealer'
    self.deposit = INITIAL_DEPOSIT
    @cards = []
  end

  def new_deck
    @deck = Deck.new
    deck.shuffle
  end

  def open_cards
    "Dealer: #{cards_print}, #{points} points (#{deposit}$)"
  end

  def deal_card
    deck.take_top
  end

  def to_s
    "Dealer: #{print_closed_cards}, ? points (#{deposit}$)"
  end

  private

  attr_reader :deck

  def print_closed_cards
    ('** ' * @cards.size).strip
  end
end
