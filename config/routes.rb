Rails.application.routes.draw do

 devise_for :users, controllers: { registrations: "users/session" }

  get 'home/home'
  root 'notes#index'
  post 'notes/new'

  resources :users
  get 'users/show'


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
