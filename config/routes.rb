Rails.application.routes.draw do
  get 'top', to: 'tops#index'
  get    'login',   to: 'user_sessions#new'
  post   'login',   to: 'user_sessions#create'
  delete 'logout',  to: 'user_sessions#destroy'
end
