Rails.application.routes.draw do
  resources :recipe_ingredients, only: [:new, :create, :destroy]
  resources :recipes
  resources :ingredients
end
