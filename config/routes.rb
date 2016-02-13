Rails.application.routes.draw do
  root 'media_items#index'
  devise_for :users
  resources :media_items
end
