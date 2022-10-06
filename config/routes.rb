Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

#AUTHENTICATION
  post '/auth/register', to: 'authentication#create_account'
  post 'auth/login', to: 'authentication#login_account'

  # root "articles#index"
end
