# frozen_string_literal: true

# Test for Dealer class

require_relative '../dealer'

dealer = Dealer.new

describe Dealer do
  it 'should create new dealer' do
    expect(dealer).to be_instance_of(Dealer)
  end

  it 'should deal a card from a shuffled deck' do
    expect(dealer.deal_card).not_to eq Deck.new.take_top
  end

  it 'should count cards with aces correctly' do
    cards = [Card.new(suit: '♣', rank: 'A', value: 1)]
    cards << Card.new(suit: '♦', rank: 'A', value: 1)
    cards << Card.new(suit: '♦', rank: '9', value: 9)
    expect(dealer.count_cards(cards)).to eq 21
  end
end
