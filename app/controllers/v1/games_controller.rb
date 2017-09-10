class V1::GamesController < V1::ApiController

  def get_winner
    hands = []
    params[:hands].each do |hand_param|
      cards=[]
      hand_param[:cards].each do |card_param|
        cards.push(Card.new(card_param[:number], card_param[:suit]))
      end
      hands.push(Hand.new(cards))
    end
    game = Game.new(hands.first,hands.last)
    render json: {winner: game.winner}
  end
end
