Rails.application.routes.draw do
  get 'welcome/index'

  root "welcome#index"
  get 'auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', as: :github_logout, to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
