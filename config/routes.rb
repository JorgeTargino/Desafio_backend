Rails.application.routes.draw do
  get 'site/index'
  resources :event_histories
  resources :subscriptions
  resources :statuses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
