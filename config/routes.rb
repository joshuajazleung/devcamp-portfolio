Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :pfl_items, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'pfl_items#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  get 'tech-news', to: 'pages#tech_news'

  resources :blogs do
    member do
      get :toggle_status
    end
  end 
  
  root to: 'pages#home'

  mount ActionCable.server => '/cable'
end
