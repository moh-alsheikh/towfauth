Rails.application.routes.draw do
  
  resources :tasks
  devise_for :users
  root to: 'home#welcome'
  
  match '/home/sign_up_otp' => 'home#sign_up_otp', via: :get, :as => :sign_up_otp, :path=> "signupotp"
  match '/home/sign_in_otp' => 'home#sign_in_otp', via: :get, :as => :sign_in_otp, :path=> "signinotp"
  post 'home/validatetoken', :path=> "validatetoken"     , :as=> "validatetoken"
  
end


__END__


  match '/home/sign_up_otp' => 'home#sign_up_otp', via: [:get, :post], :as => :sign_up_otp, :path=> "signupotp"