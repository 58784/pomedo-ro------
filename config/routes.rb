Rails.application.routes.draw do
  get 'top', to: 'tops#index'
  get    'login',   to: 'sessions#new'
  post   'login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
end
