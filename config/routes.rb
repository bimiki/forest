Rails.application.routes.draw do



  get 'home/home'
  root 'notes#index'
  post 'notes/new'
  get 'users/profile'
  resources :users
  resources :notes do
    member do
      patch "upvote", to: "notes#upvote"
      patch "downvote", to: "notes#downvote"
    resources :tasks

    end
  end

  namespace :notes do
    resources :tasks
  end

  devise_for :users

end
