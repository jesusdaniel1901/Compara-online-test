class Game
  attr_accessor :hand_1,:hand_2

  def initialize(hand_1,hand_2)
    self.hand_1 = hand_1
    self.hand_2 = hand_2
  end

  def winner
    return determine_winner(hand_1,hand_2) if hand_1.rank.values.first.nil? && hand_1.rank.values.first.nil?

    return "WINNER IS HAND 1 with #{hand_1.rank.keys.first}" if hand_2.rank.values.first.nil?

    return "WINNER IS HAND 2 with #{hand_2.rank.keys.first}" if hand_1.rank.values.first.nil?

    if hand_1.rank.values.first > hand_2.rank.values.first
      return "WINNER IS HAND 1 with #{hand_1.rank.keys.first}"
    elsif hand_2.rank.values.first > hand_1.rank.values.first
      return "WINNER IS HAND 2 with #{hand_2.rank.keys.first}"
    elsif hand_1.rank.values.first  == hand_2.rank.values.first
      determine_winner(hand_1,hand_2)
    end

  end


  def determine_winner(hand_1,hand_2)
    cards_1 = hand_1.cards
    cards_2 = hand_2.cards

    cards_1 = cards_1.sort_by {|card| card.value}.reverse
    cards_2 = cards_2.sort_by {|card| card.value}.reverse

    for i in 0..5
      if cards_1[i].value > cards_2[i].value
        return "WINNER IS HAND 1 WITH A VALUE CARD OF #{cards_1[i].value_of_card}"
      elsif cards_1[i].value < cards_2[i].value
        return "WINNER IS HAND 2 WITH A VALUE CARD OF #{cards_2[i].value_of_card}"
      end
    end
    return "TIE"
  end


end