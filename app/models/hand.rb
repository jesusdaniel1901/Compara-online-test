class Hand
  attr_accessor :cards,:repeated_cards_hash

  RANKING={
    one_pair: 2,
    two_pairs: 3,
    three_of_a_kind: 4,
    straight: 5,
    flush: 6,
    full_house: 7,
    four_of_a_kind: 8,
    straight_flush: 9,
    royal_flush: 10
  }

  def initialize(cards)
    @repeated_cards_hash = {}
    @cards = cards
    sort_cards
    count_repeated_cards
  end

  def sort_cards
    @cards = @cards.sort_by {|card| card.value}
  end

  def cards_values
    @cards.map{ |card| card.value }
  end

  def count_repeated_cards
    @cards.each do |card|
      if @repeated_cards_hash.key?(card.value)
        counter = @repeated_cards_hash[card.value]
        @repeated_cards_hash[card.value] = counter + 1
      else
        @repeated_cards_hash[card.value] = 1
      end
    end
    @repeated_cards_hash.reject! { |value,count| count == 1 }
  end

  def repeated_values
    @repeated_cards_hash.values.to_a
  end

  def one_pair?
    repeated_values.include?(2)
  end

  def two_pairs?
    counter = 0
    repeated_values.each do |value|
      counter +=1 if value == 2
    end
    return counter == 2
  end

  def three_of_a_kind?
    repeated_values.include?(3)
  end

  def straight?
    count_cards = 0
    for i in 0..@cards.length-2
      if @cards[i].value == @cards[i+1].value - 1
        count_cards += 1
      end
    end
    return count_cards == 4
  end

  def flush?
    suites_array = @cards.map {|card| card.suit }
    return suites_array.all? {|x| x == suites_array[0]}
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def four_of_a_kind?
    repeated_values.include?(4)
  end

  def straight_flush?
    straight? && flush?
  end

  def royal_flush?
    cards_values.include?(10) && cards_values.include?(11) && cards_values.include?(12) && cards_values.include?(13) && cards_values.include?(14) && flush?
  end

  def get_max_card
    return cards_values.last
  end

  def delete_card(card_to_delete)
    card = @cards.find { |card| card == card_to_delete }
    @cards.delete(card)
  end

  def rank
    ranking = RANKING.select { |method, rank| send :"#{method}?" }
    max_value = ranking.values.last
    return ranking.reject { |method,rank| rank != max_value }
  end


end