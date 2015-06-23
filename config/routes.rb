Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index, :show]
    #resources :bookmarks, only: [:new, :create]
  end

  #resources :bookmarks, only: [:edit, :update, :destroy]

  get 'welcome/about'

  post 'incoming', to: 'incoming#create'
  
  root to: 'welcome#index'
end
