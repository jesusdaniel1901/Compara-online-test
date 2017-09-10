class V1::DealerController < V1::ApiController

  def deck
    response = Dealer.get_deck_token
    if !response.include? 'Error'
      render json: {token: response}
    else
      json_error = JSON.parse(response)
      render json: json_error,status: :internal_server_error
    end
  end

  def deal
    response = Dealer.deal(params[:token])
    if !response.include? 'Error'
      json_cards = JSON.parse(response)
      render json: json_cards
    else
      json_error = JSON.parse(response)
      render json: json_error,status: :internal_server_error
    end
  end

end
