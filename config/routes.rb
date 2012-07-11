Crowdrama::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :dramas
  resources :submissions
  root to: 'home#show'

  match 'backdoor' => 'backdoor#login' if Rails.env.test?
end
