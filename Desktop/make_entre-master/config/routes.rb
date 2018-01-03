Rails.application.routes.draw do
    
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :events
    
  devise_for :users
    
  devise_scope :admin_user do
      get '/admin_users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :like_notes
    end
  end

  resources :notes, only: [:show, :create, :edit, :update, :destroy] do
    member do
      get :liking_users
    end
  end

  post '/like/:note_id' => 'likes#like', as: 'like'
  delete '/unlike/:note_id' => 'likes#unlike', as: 'unlike'

  root 'toppage#index'
  get '/about' => 'home#about'
end
