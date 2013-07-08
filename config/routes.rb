Makaton::Application.routes.draw do

  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "devise/registrations"}
  ActiveAdmin.routes(self)
  match "pictures/list" => "pictures#list"
  match "pictogrammes/list" => "pictogrammes#list"
  match "home/:action" => "home"
 
  
  match "users/pictures_categories_stats" => "users#pictures_categories_stats"
  match "users/pictures_galleries_stats" => "users#pictures_galleries_stats"
  match "users/pictures_exercices_stats" => "users#pictures_exercices_stats"
  
  match "exercices/describe/:action" => "exercices/describe"
  match "exercices/categories_galleries/:action" => "exercices/categories_galleries"
  resources :pictogrammes
  resources :pictures
  resources :users
  match "/user_stats/:action" => "user_stats"
  get ':id', to: 'pages#show', as: :page
end
