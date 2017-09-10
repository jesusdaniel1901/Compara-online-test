class Dealer

  def self.get_deck_token
    response = Faraday.post 'https://services.comparaonline.com/dealer/deck'
    return response.body
  end

  def self.deal(token)
    response = Faraday.get "https://services.comparaonline.com/dealer/deck/#{token}/deal/5"
    return response.body
  end

end