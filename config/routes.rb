Rails.application.routes.draw do
  resources :products, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      post :sync
      post :add_to_cart
    end
  end
  resources :carts, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
