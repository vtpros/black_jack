# frozen_string_literal: true

require_relative 'resource/card_constants'

# Card class
class Card
  attr_accessor :suit, :rank, :value

  def initialize(suit:, rank:, value:)
    validate!(suit, rank)
    @suit = suit
    @rank = rank
    @value = value
  end

  def ==(card)
    suit == card.suit && rank == card.rank
  end

  def to_s
    "#{rank}#{suit}"
  end

  private

  def validate!(suit, rank)
    valid = SUITS.include?(suit) && RANKS.include?(rank)
    raise 'invalid suit or rank' unless valid
  end
end
