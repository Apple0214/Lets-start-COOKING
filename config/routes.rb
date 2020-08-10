Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get "recipes/:id/edit"=>"recipes#edit"
  post "recipes/:id/update"=>"recipes#update"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'likes/index'
  post '/like/:id' => 'likes#like',   as: 'like'
  delete '/like/:id' => 'likes#unlike', as: 'unlike'
  root 'homes#index'
  resources :comments, only: [:index, :show]
  resources :genres, only: [:index, :show, :new, :create]
  #ネストすることによって、どのレシピに対するコメントかが分かるようにしたい。
  resources :recipes, only: [:index, :show, :new, :edit, :create] do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy, :index]
  end
  resources :homes, only: [:index, :new]
  resources :user,only: [:show, :edit, :new]
end
