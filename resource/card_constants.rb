# frozen_string_literal: true

SUITS = %w[♠ ♥ ♦ ♣].freeze
RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
VALUES = %w[2 3 4 5 6 7 8 9 10 10 10 10 1].map(&:to_i).freeze
RANK_WITH_VALUE = RANKS.zip(VALUES).to_h.freeze
