# frozen_string_literal: true

require_relative 'card_constants'

# Player and Dealer common methods
module Players
  INITIAL_DEPOSIT = 100

  attr_reader :deposit

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

  def points
    total = 0
    ace = false
    cards.each do |card|
      total += card.value
      ace ||= (card.rank == 'A')
    end
    (total += REMAINDER unless total + REMAINDER > MAX_POINTS) if ace
    total
  end

  private

  attr_reader :cards
  attr_writer :deposit

  def cards_print
    cards.map { |card| "#{card.rank}#{card.suit}" }.join(' ')
  end
end
