Rails.application.routes.draw do

  get 'home/home'
  root 'notes#index'

  resources :notes do
    resources :tasks
  end
  namespace :notes do
    resources :tasks
  end
  devise_for :users



end
