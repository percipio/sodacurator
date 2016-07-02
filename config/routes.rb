Rails.application.routes.draw do
  namespace :admin do
    resources :tags
    resources :users
    resources :sodas
    resources :bottlers

    root to: 'sodas#index'
  end

  # root route
  root 'pages#home'
  get 'feed' => 'soda#feed', :defaults => { format: 'atom' }

  # Static Pages
  get 'home' 		=> 'pages#home'
  get 'about' => 'pages#about'
  get 'terms-and-conditions' 		=> 'pages#terms_and_conditions'
  get 'privacy-policy' 		=> 'pages#privacy_policy'
  get 'launch-signup'     => 'pages#launch_signup'
  get 'confirmation-sent' => 'pages#confirmation-sent'
  get 'thank-you' => 'pages#thank_you'
  get 'thanks' => 'pages#thanks'
  get 'thanks-for-subscribing' => 'pages#thanks_for_subscribing'
  get 'subscribed' => 'pages#subscribed'
  get 'subscribe-error' => 'pages#subscribe_error'
  get 'sodas/featured' => 'sodas#featured'
  get 'sodas/*other' => 'sodas#random', as: 'sodas_random'

  # Authentication
  # get 'signup'      => 'users#new'
  get 'signin'      => 'sessions#new'
  post 'signin'     => 'sessions#create'
  get 'signout' => 'sessions#destroy'

  # Resources
  resources :sodas, only: [:index, :show]
  resources :bottlers, only: [:index, :show]
  # resources :users
  # resources :account_activations, only: [:edit]
  # resources :password_resets,     only: [:new, :create, :edit, :update]
end
