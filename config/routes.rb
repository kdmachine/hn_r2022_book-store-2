Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "store#home"
    get "store/home"
    get "/books", to: "store#books"
    get "/order", to: "store#order"
    get "/cart", to: "store#cart"
    post "/cart", to: "store#cart"
    get "/checkout", to: "store#checkout"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    delete "/logout", to: "sessions#destroy"
    delete "/carts", to: "carts#destroy", as: :delete_cart
    put "/minus_items", to: "minus_items#update", as: :quantity_minus
    put "/plus_items", to: "plus_items#update", as: :quantity_plus

    resources :categories, only: %i(show)
    resources :books
    resources :carts, only: :create
    resources :orders, only: %i(new create)
    namespace :admin do
      resources :homes
      resources :categories
      resources :products
      resources :orders
      resources :accounts
      resources :books do
        member do
          delete :delete_image_attachment
        end
      end
    end
    resources :users
  end
end
