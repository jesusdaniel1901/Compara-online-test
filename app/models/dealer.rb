class Dealer

  def self.get_deck_token
    response = Faraday.post 'https://services.comparaonline.com/dealer/deck'
    return build_json(response.body)
  end

  def self.deal(token)
    response = Faraday.get "https://services.comparaonline.com/dealer/deck/#{token}/deal/5"
    return build_json(response.body)
  end

  def self.build_json(response)
    if !response.include? 'error'
      begin
        json_cards = JSON.parse(response)
        return json_cards
      rescue JSON::ParserError => e
        return {token: response}.as_json
      end
    else
      json_error = JSON.parse(response)
      return json_error
    end
  end

end