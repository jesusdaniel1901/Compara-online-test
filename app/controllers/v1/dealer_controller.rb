class V1::DealerController < V1::ApiController

  def deck
    response = Dealer.get_deck_token
    render json: response,status: response["statusCode"].present? ? response["statusCode"].to_i : 200
  end

  def deal
    return render json: {error: 'Please send the token the cards'} unless params[:token].present?
    response = Dealer.deal(params[:token])
    render json: response,status: response.first.first == "statusCode" ? response["statusCode"] : 200
  end

end
