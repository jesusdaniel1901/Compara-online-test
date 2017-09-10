require 'rails_helper'

RSpec.describe Game, type: :model do

  describe 'Game#winner' do

    it 'Test two hands with one pair' do
      cards_1 =[]
      cards_1.push(Card.new({:number => "J", :suit => "spades"}))
      cards_1.push(Card.new({:number => "10", :suit => "spades"}))
      cards_1.push(Card.new({:number => "9", :suit => "spades"}))
      cards_1.push(Card.new({:number => "9", :suit => "hearts"}))
      cards_1.push(Card.new({:number => "7", :suit => "hearts"}))

      cards_2 =[]
      cards_2.push(Card.new({:number => "10", :suit => "hearts"}))
      cards_2.push(Card.new({:number => "J", :suit => "spades"}))
      cards_2.push(Card.new({:number => "Q", :suit => "spades"}))
      cards_2.push(Card.new({:number => "9", :suit => "clubs"}))
      cards_2.push(Card.new({:number => "7", :suit => "hearts"}))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 1 with one_pair'
    end

    it 'Test two hands with two_pairs' do
      cards_1 =[]
      cards_1.push(Card.new(nil,"J", "spades"))
      cards_1.push(Card.new(nil, "10",  "spades"))
      cards_1.push(Card.new(nil,"9",  "spades"))
      cards_1.push(Card.new(nil, "9", "hearts"))
      cards_1.push(Card.new(nil, "10", "hearts"))

      cards_2 =[]
      cards_2.push(Card.new(nil, "10", "hearts"))
      cards_2.push(Card.new(nil, "J",  "spades"))
      cards_2.push(Card.new(nil,"Q",  "spades"))
      cards_2.push(Card.new(nil, "9", "clubs"))
      cards_2.push(Card.new(nil, "7", "hearts"))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 1 with two_pairs'
    end

    it 'Test two hands with a three_of_a_kind' do
      cards_1 =[]
      cards_1.push(Card.new( nil,"J", "clubs"))
      cards_1.push(Card.new( nil,"10",  "spades"))
      cards_1.push(Card.new(nil,"9",  "hearts"))
      cards_1.push(Card.new(nil, "9", "hearts"))
      cards_1.push(Card.new(nil, "9", "hearts"))

      cards_2 =[]
      cards_2.push(Card.new( nil,"10", "hearts"))
      cards_2.push(Card.new(nil, "J",  "spades"))
      cards_2.push(Card.new(nil,"Q",  "spades"))
      cards_2.push(Card.new(nil, "9", "clubs"))
      cards_2.push(Card.new(nil, "7", "hearts"))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 1 with three_of_a_kind'
    end

    it 'Test two hands with an straight' do
      cards_1 =[]
      cards_1.push(Card.new(nil, "J", "clubs"))
      cards_1.push(Card.new( nil,"10",  "spades"))
      cards_1.push(Card.new(nil,"9",  "hearts"))
      cards_1.push(Card.new(nil, "8", "hearts"))
      cards_1.push(Card.new(nil, "7", "hearts"))

      cards_2 =[]
      cards_2.push(Card.new(nil, "10", "hearts"))
      cards_2.push(Card.new(nil, "J",  "spades"))
      cards_2.push(Card.new(nil,"Q",  "spades"))
      cards_2.push(Card.new(nil, "9", "clubs"))
      cards_2.push(Card.new(nil, "7", "hearts"))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 1 with straight'
    end

    it 'Test two hands with a flush' do
      cards_1 =[]
      cards_1.push(Card.new(nil, "K", "hearts"))
      cards_1.push(Card.new(nil, "10",  "hearts"))
      cards_1.push(Card.new(nil,"9",  "hearts"))
      cards_1.push(Card.new(nil, "9", "hearts"))
      cards_1.push(Card.new(nil, "9", "hearts"))

      cards_2 =[]
      cards_2.push(Card.new(nil, "10", "hearts"))
      cards_2.push(Card.new(nil, "J",  "spades"))
      cards_2.push(Card.new(nil,"Q",  "spades"))
      cards_2.push(Card.new(nil, "9", "clubs"))
      cards_2.push(Card.new(nil, "7", "hearts"))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 1 with flush'
    end

    it 'Test two hands with a full_house' do
      cards_1 =[]
      cards_1.push(Card.new(nil, "10", "hearts"))
      cards_1.push(Card.new(nil, "10",  "hearts"))
      cards_1.push(Card.new(nil,"9",  "spades"))
      cards_1.push(Card.new(nil, "9", "hearts"))
      cards_1.push(Card.new(nil, "9", "clubs"))

      cards_2 =[]
      cards_2.push(Card.new( nil,"10", "hearts"))
      cards_2.push(Card.new( nil,"J",  "spades"))
      cards_2.push(Card.new(nil,"Q",  "spades"))
      cards_2.push(Card.new(nil, "9", "clubs"))
      cards_2.push(Card.new( nil,"7", "hearts"))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 1 with full_house'
    end

    it 'Test two hands with a four_of_a_kind' do
      cards_1 =[]
      cards_1.push(Card.new(nil, "10", "hearts"))
      cards_1.push(Card.new( nil,"10",  "hearts"))
      cards_1.push(Card.new(nil,"10",  "spades"))
      cards_1.push(Card.new(nil, "10", "hearts"))
      cards_1.push(Card.new( nil,"9", "clubs"))

      cards_2 =[]
      cards_2.push(Card.new(nil, "10", "hearts"))
      cards_2.push(Card.new(nil, "J",  "spades"))
      cards_2.push(Card.new(nil,"Q",  "spades"))
      cards_2.push(Card.new(nil, "9", "clubs"))
      cards_2.push(Card.new(nil, "7", "hearts"))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 1 with four_of_a_kind'
    end

    it 'Test two hands with a four of a straight_flush' do
      cards_1 =[]
      cards_1.push(Card.new(nil, "J", "hearts"))
      cards_1.push(Card.new(nil, "10",  "hearts"))
      cards_1.push(Card.new(nil,"9",  "hearts"))
      cards_1.push(Card.new(nil, "8", "hearts"))
      cards_1.push(Card.new(nil, "7", "hearts"))

      cards_2 =[]
      cards_2.push(Card.new(nil, "10", "hearts"))
      cards_2.push(Card.new(nil, "J",  "spades"))
      cards_2.push(Card.new(nil,"Q",  "spades"))
      cards_2.push(Card.new(nil, "9", "clubs"))
      cards_2.push(Card.new(nil, "7", "hearts"))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 1 with straight_flush'
    end

    it 'Test two hands with a four of a royal_flush' do
      cards_1 =[]
      cards_1.push(Card.new(nil, "A", "hearts"))
      cards_1.push(Card.new(nil, "K",  "hearts"))
      cards_1.push(Card.new(nil,"Q",  "hearts"))
      cards_1.push(Card.new(nil, "J", "hearts"))
      cards_1.push(Card.new( nil,"10", "hearts"))

      cards_2 =[]
      cards_2.push(Card.new(nil, "10", "hearts"))
      cards_2.push(Card.new(nil, "J",  "spades"))
      cards_2.push(Card.new(nil,"Q",  "spades"))
      cards_2.push(Card.new(nil, "9", "clubs"))
      cards_2.push(Card.new(nil, "7", "hearts"))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 1 with royal_flush'
    end

    it 'Test two hands with the highest_card' do
      cards_1 =[]
      cards_1.push(Card.new(nil, "A", "hearts"))
      cards_1.push(Card.new(nil, "J",  "spades"))
      cards_1.push(Card.new(nil,"3",  "hearts"))
      cards_1.push(Card.new(nil, "4", "clubs"))
      cards_1.push(Card.new(nil, "5", "hearts"))

      cards_2 =[]
      cards_2.push(Card.new(nil, "2", "hearts"))
      cards_2.push(Card.new(nil, "3",  "spades"))
      cards_2.push(Card.new(nil,"6",  "spades"))
      cards_2.push(Card.new(nil, "7", "clubs"))
      cards_2.push(Card.new(nil, "8", "hearts"))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 1 WITH A VALUE CARD OF A'
    end

    it 'Test two hands with the highest_card having each player two_pairs' do
      cards_1 =[]
      cards_1.push(Card.new(nil, "7", "hearts"))
      cards_1.push(Card.new(nil, "7",  "spades"))
      cards_1.push(Card.new(nil,"Q",  "hearts"))
      cards_1.push(Card.new(nil, "4", "clubs"))
      cards_1.push(Card.new(nil, "5", "hearts"))

      cards_2 =[]
      cards_2.push(Card.new(nil, "A", "hearts"))
      cards_2.push(Card.new(nil, "3",  "spades"))
      cards_2.push(Card.new(nil,"6",  "spades"))
      cards_2.push(Card.new(nil, "7", "clubs"))
      cards_2.push(Card.new(nil, "7", "hearts"))

      hand_1 = Hand.new(cards_1)

      hand_2 = Hand.new(cards_2)

      game = Game.new(hand_1,hand_2)

      expect(game.winner).to eq 'WINNER IS HAND 2 WITH A VALUE CARD OF A'
    end

  end



end