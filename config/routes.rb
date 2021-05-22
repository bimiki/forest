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

  # this is the one i tried to write myself kinda but couldnt get to work so maybe use letsrate ? 
  resources :video do
  resources :rating

end
end
