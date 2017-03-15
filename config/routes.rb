Rails.application.routes.draw do
  root 'users#index'
  post 'users/create' => 'users#create'
  post 'users/logout' => 'users#logout'

  get 'posts/' => 'posts#index'
  post 'posts/create' => 'posts#create'
  delete 'posts/:id'=> 'posts#destroy'

  post 'comments/create' => 'comments#create'
  delete 'comments/:id' => 'comments#destroy'
end
