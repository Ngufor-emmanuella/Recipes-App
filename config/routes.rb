Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "foods#index"
  resources :users do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
    resources :recipes, only: [:index, :show, :new, :create, :destroy, :public] do
      resources :recipe_foods, only: [:create, :new, :destroy]
    end
  end
  # Defines the root path route ("/")
  get 'public_recipes' => 'recipes#public_recipes'
  resources :shoppings, only:[:index]
end
