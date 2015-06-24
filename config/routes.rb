Rails.application.routes.draw do

  devise_for :users

  resources :topics

  get 'welcome/about'
  
  post 'incoming', to: 'incoming#create'
  
  root to: 'welcome#index'
end
