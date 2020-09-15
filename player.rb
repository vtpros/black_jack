# frozen_string_literal: true

require_relative 'resource/players'

# Player class
class Player
  include Players

  def initialize(name:)
    @name = name
    self.deposit = INITIAL_DEPOSIT
    @cards = []
  end

  def to_s
    point = points
    point = "#{min_points}/#{points}" if min_points < points
    "#{name}: #{cards_print}, #{point} points (#{deposit}$)"
  end
end
