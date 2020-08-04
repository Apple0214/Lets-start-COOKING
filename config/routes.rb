Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post   '/like/:home_id' => 'likes#like',   as: 'like'
  delete '/like/:home_id' => 'likes#unlike', as: 'unlike'
  root 'homes#index'
  resources :comments, only: [:index, :show]
  resources :favorite_recipes, only: [:index, :show]
  resources :genres, only: [:index, :show, :new, :create]
  #ネストすることによって、どのレシピに対するコメントかが分かるようにしたい。
  resources :recipes, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :homes, only: [:index, :new]
  resources :user,only: [:show, :edit, :new]
end
