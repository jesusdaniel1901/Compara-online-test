class V1::DealerController < V1::ApiController

  def deck
      response = Faraday.post 'https://services.comparaonline.com/dealer/deck'
      if !response.body.include? 'Error'
        render json: {token: response.body}
      else
        json_error = JSON.parse(response.body)
        render json: json_error,status: :internal_server_error
      end
  end

  def deal
    response = Faraday.get "https://services.comparaonline.com/dealer/deck/#{params[:token]}/deal/5"
    if !response.body.include? 'Error'
      json_cards = JSON.parse(response.body)
      render json: json_cards
    else
      json_error = JSON.parse(response.body)
      render json: json_error,status: :internal_server_error
    end
  end

end
