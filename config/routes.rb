Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  get "search" => "search#index" 
  post "search" => "search#search" 

  resources :customers do 
    resources :punches
  end  

  get '/home' => 'welcome#user_home'
  
  root 'welcome#index'

end
