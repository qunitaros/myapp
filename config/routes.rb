Rails.application.routes.draw do
  resources :tasks
  root to: 'homes#show'
  resources :terms
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
