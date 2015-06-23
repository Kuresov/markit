Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index, :show], controller: 'topics/bookmarks'
  end

  get 'welcome/about'

  post 'incoming', to: 'incoming#create'

  root to: 'welcome#index'
end
