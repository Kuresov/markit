Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    #resources :bookmarks, only: [:show, :new, :edit]
    resources :bookmarks, except: [:index]
  end

  get 'welcome/about'

  post 'incoming', to: 'incoming#create'
  
  root to: 'welcome#index'
end
