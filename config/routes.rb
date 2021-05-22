Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'home/home'
  root 'notes#index'

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
end
