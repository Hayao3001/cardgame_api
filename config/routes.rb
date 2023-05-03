Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace 'api' do
    namespace 'v1' do
      get "/rooms" => "rooms#index"
      get "/rooms/:id" => "rooms#show" 
      delete "/rooms/:id" => "rooms#destroy"
      post "/rooms", to: "rooms#create"
      put "/rooms/:id", to: "rooms#update"
      # resources :rooms
    end
  end
end
