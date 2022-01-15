class Card

  VALUES = ('a'..'z').to_a
  attr_reader :value

  def initialize(value, revealed = false)
    @value = value
    @revealed = revealed
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def revealed?
    @revealed
  end

  def self.shuffled_pairs(num_pairs)

    possible_values = VALUES.shuffle!

    cards = []

    num_pairs.times do
      card_val = possible_values.pop

      card_1 = Card.new(card_val)
      card_2 = Card.new(card_val)

      cards.concat([card_1, card_2])
    end
    
    cards.shuffle!
  end
end
