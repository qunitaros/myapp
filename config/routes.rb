Rails.application.routes.draw do
  root to: 'homes#show'
  resources :terms
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
