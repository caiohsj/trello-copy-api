Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
      resources :boards
      resources :cards
      resources :columns
    end
  end
end
