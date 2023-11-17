Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "lists#index"
  # get "lists/new", to: "lists#new", as: :new
  # get "lists/:id", to: "lists#show", as: :show
  # # Show List by id of Tasks
  # post "lists", to: "lists#create"
  # get "lists/list_id/bookmarks/new",  to: "bookmarks#new", as: :bookmark_new
  # post "lists/list_id/bookmarks",  to: "bookmarks#create"

  # resource:lists, only:[:index, :show, :new,:create]
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]

end
