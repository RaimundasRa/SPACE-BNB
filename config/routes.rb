Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/colonies/my_colonies/', to: 'colonies#show_my_colonies', as: :my_colonies

  resources :colonies
    # get 'my_colonies', to: 'colonies#showmine'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
