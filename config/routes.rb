Rails.application.routes.draw do

  namespace :v1 do
    resources :dealer,only: [] do
      collection do
        post :deck
        get :deal
      end
    end
    resource :games,only: [] do
      post 'get-winner', action: :get_winner
    end
  end


end
