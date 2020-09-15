# frozen_string_literal: true

require_relative 'card_constants'

# Player and Dealer common methods
module Players
  INITIAL_DEPOSIT = 100

  attr_reader :deposit, :name

  def num_cards
    cards.size
  end

  def recieve_card(card)
    cards << card
  end

  def stake(sum)
    self.deposit -= sum
    sum
  end

  def receive_money(sum)
    self.deposit += sum
  end

  def min_points
    cards.map(&:value).sum
  end

  def points
    total = min_points
    (total += REMAINDER unless total + REMAINDER > MAX_POINTS) if ace?
    total
  end

  def reset
    @cards = []
  end

  private

  attr_reader :cards
  attr_writer :deposit

  def ace?
    cards.any? { |card| card.rank == 'A' }
  end

  def cards_print
    cards.map { |card| "#{card.rank}#{card.suit}" }.join(' ')
  end
end
