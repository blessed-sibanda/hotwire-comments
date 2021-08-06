Rails.application.routes.draw do
  resources :projects do
    resources :comments, only: :create
  end
  root to: "projects#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
