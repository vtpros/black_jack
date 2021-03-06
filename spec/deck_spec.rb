# frozen_string_literal: true

# Test for Deck and Card classes

require_relative '../deck'

deck1 = Deck.new
deck2 = Deck.new

describe Deck do
  it 'should take same top card from unshuffled decks' do
    expect(deck1.take_top).to eq deck2.take_top
  end

  it 'should decrease cards left after card is taken' do
    expect(deck1.cards_left).to eq 51
    expect(deck2.cards_left).to eq 51
  end

  it 'should have same value for the cards with the same suit and rank' do
    expect(deck1.take_top.value).to eq deck2.take_top.value
  end

  it 'should shuffle decks' do
    deck1.shuffle
    deck2.shuffle
    expect(deck1.take_top).not_to eq deck2.take_top
  end

  it 'should return nil for take_top after all cards are taken' do
    deck1.cards_left.times { deck1.take_top }
    expect(deck1.take_top).to be nil
  end

  it 'should print rank and suit' do
    expect(Deck.new.take_top.to_s).to eq('A♣')
  end
end
