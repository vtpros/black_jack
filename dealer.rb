# frozen_string_literal: true

require_relative 'deck'

# Dealer class
class Dealer
  attr_accessor :nada

  def initialize
    @deck = Deck.new
    deck.shuffle
  end

  def deal_card
    deck.take_top
  end

  private

  attr_reader :deck

end
