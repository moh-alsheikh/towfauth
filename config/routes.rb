Rails.application.routes.draw do
  
  resources :tasks
  devise_for :users
  root to: 'home#welcome'
  
  match '/home/complete_sign_up' => 'home#complete_sign_up', via: [:get, :post], :as => :complete_sign_up, :path=> "complete_sign_up"
  match '/home/complete_sign_in' => 'home#complete_sign_in', via: [:get, :post], :as => :complete_sign_in, :path=> "complete_sign_in"
  
end
