Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      patch '/users', to: 'users#update'
    end
  end
end
end
