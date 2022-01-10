Rails.application.routes.draw do

  resources :game_genres
  namespace :api do
    namespace :v1 do
      resources :genres      
      resources :games
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
