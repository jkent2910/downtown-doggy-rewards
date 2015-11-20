Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :admins
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :customers do 
    resources :punches
  end
  

end
