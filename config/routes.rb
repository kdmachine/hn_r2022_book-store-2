Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "store#home"
    get "store/home"
    get "/product", to: "store#product"
    get "/order", to: "store#order"
    get "/cart", to: "store#cart"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    delete "/logout", to: "sessions#destroy"

    resources :categories, only: %i(show)
    namespace :admin do
      resources :homes
      resources :categories
      resources :products
      resources :orders
      resources :accounts
      resources :books
    end
    resources :users
  end
end
