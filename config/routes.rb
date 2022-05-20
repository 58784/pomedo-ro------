Rails.application.routes.draw do
  root to: 'tops#index'
  get    'login',   to: 'user_sessions#new'
  post   'login',   to: 'user_sessions#create'
  delete 'logout',  to: 'user_sessions#destroy'

  resources :users, only: %i[new create show edit update destroy]
  resources :password_resets, only: %i[new create edit update]
  resources :timers
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
