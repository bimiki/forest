Rails.application.routes.draw do
  resources :notes do
    resources :tasks
  end
  namespace :notes do
    resources :tasks
  end
  devise_for :users

  resources :video do
  resources :rating
end

  get 'home/home'
  root 'notes#index'

end
