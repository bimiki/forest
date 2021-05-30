Rails.application.routes.draw do
  
  get 'home/home'
  root 'notes#index'

  resources :notes do
    resources :tasks
    member do
      patch "upvote", to: "notes#upvote"
      patch "downvote", to: "notes#downvote"
    end

  end
  namespace :notes do
    resources :tasks
  end
  devise_for :users
end
