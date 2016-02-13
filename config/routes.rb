Rails.application.routes.draw do
  root 'wall#index'
  devise_for :users
  get 'wall/index'
  resources :media_items
end
