Rails.application.routes.draw do
  root to: 'homes#show'
  resources :terms
  resources :tasks
  resources :notes
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
