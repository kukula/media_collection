Rails.application.routes.draw do
  root 'wall#index'
  devise_for :users
  get 'wall/index'
end
