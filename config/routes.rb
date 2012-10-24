Crowdrama::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :submissions do
    resources :votes, only: :create
  end

  resources :dramas, only: :index

  resource :subscription, only: [:edit, :update, :show]

  root to: 'home#show'

  match 'backdoor' => 'backdoor#login' if Rails.env.test?
end
