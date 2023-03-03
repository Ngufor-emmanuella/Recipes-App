Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'recipes' => 'recipes#index'
  get 'foods' => 'foods#index'
  
  resources :users do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
  end
end
