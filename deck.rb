# frozen_string_literal: true

require_relative 'card'
require_relative 'resource/card_constants'

# Card class
class Deck
  attr_reader :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      RANK_WITH_VALUE.each do |rank, value|
        self.cards << Card.new(suit: suit, rank: rank, value: value)
      end
    end
  end

  def shuffle
    cards.shuffle!
  end

  def take_top
    cards.pop unless cards_left.zero?
  end

  def cards_left
    @cards.size
  end
end
