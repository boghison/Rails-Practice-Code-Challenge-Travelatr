Rails.application.routes.draw do
  resources :bloggers, only: [:index, :new, :create, :show]
  resources :destinations, only: [:index, :show]
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  get "/posts/:id/like", to: "posts#like", as: "like_post"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
