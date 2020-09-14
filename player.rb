# frozen_string_literal: true

require_relative 'resource/players'

# Player class
class Player
  include Players

  attr_reader :name

  def initialize(name:)
    @name = name
    self.deposit = INITIAL_DEPOSIT
    @cards = []
  end

  def to_s
    "#{name}: #{cards_print} (#{points} points)"
  end
end
