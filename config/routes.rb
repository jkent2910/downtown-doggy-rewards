Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :admins

  get "search" => "search#index" 
  post "search" => "search#search" 
  
  root 'welcome#index'

  resources :customers do 
    resources :punches
  end
  

end
