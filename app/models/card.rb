class Card
  attr_accessor :number, :suit, :value

  def initialize(number,suit)
    @number = number
    @suit = suit
    set_value(number)
  end

  def set_value(number)
    case number
      when Card.J_CARD
        @value = 11
      when Card.Q_CARD
        @value = 12
      when Card.K_CARD
        @value = 13
      when Card.ACE_CARD
        @value = 14
      else
        @value = Integer(number)
    end
  end

  def self.J_CARD
    'J'
  end

  def self.Q_CARD
    'Q'
  end

  def self.K_CARD
    'K'
  end

  def self.ACE_CARD
    'A'
  end

  def value_of_card
    case @value
      when 11
        return Card.J_CARD
      when 12
        return Card.Q_CARD
      when 13
        return Card.K_CARD
      when 14
        return Card.ACE_CARD
      else
        return @value
    end
  end

end