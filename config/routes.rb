Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "admin#home"
    get "admin/home"
    get "/product", to: "admin#product"
    get "/order", to: "admin#order"
    get "/account", to: "admin#account"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    delete "/logout", to: "sessions#destroy"

    namespace :admin do
      resources :categories
    end
    resources :users
  end
end
