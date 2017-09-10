require 'rails_helper'

RSpec.describe Hand, type: :model do

  it 'Test a hand' do
    cards_1 =[]
    cards_1.push(Card.new( "J", "hearts"))
    cards_1.push(Card.new( "10",  "hearts"))
    cards_1.push(Card.new("9",  "hearts"))
    cards_1.push(Card.new( "8", "hearts"))
    cards_1.push(Card.new( "7", "hearts"))


    cards_2 =[]
    cards_2.push(Card.new( "10", "hearts"))
    cards_2.push(Card.new( "J",  "spades"))
    cards_2.push(Card.new("10",  "spades"))
    cards_2.push(Card.new( "9", "clubs"))
    cards_2.push(Card.new( "8", "hearts"))

    hand_1 = Hand.new(cards_1)

    hand_2 = Hand.new(cards_2)


    puts hand_1.rank
    puts hand_1.rank.values.first

    # puts hand_2.rank


    game = Game.new(hand_1,hand_2)
    puts game.winner

  end

end