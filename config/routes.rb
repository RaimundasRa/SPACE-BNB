Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/colonies/my_colonies/', to: 'colonies#show_my_colonies', as: :my_colonies
  get '/colonies/my_bookings/', to: 'bookings#show_my_bookings', as: :my_bookings
  delete '/colonies/:colony_id/bookings/:id', to: 'bookings#destroy', as: :destroy_booking

  resources :colonies do
    resources :bookings, only: [:new, :create]
    # get 'my_colonies', to: 'colonies#showmine'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
