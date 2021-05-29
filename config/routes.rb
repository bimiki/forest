Rails.application.routes.draw do

  get 'home/home'
  root 'notes#index'

  resources :notes do
    member do
      patch "upvote", to: "notes#upvote"
    resources :tasks
  end
  end
  namespace :notes do
    resources :tasks
  end
  devise_for :users



end
