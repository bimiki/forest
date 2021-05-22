Rails.application.routes.draw do
  resources :notes do
    resources :tasks
  end
  namespace :notes do
    resources :tasks
  end
  devise_for :users

  get 'home/home'
  root 'notes#index'
  resources :video do
  resources :rating
end
end
