Rails.application.routes.draw do
  devise_for :users, path_names: {sing_up: "register", sign_in: "Login", sign_out: "logout"}
 
 resources :jobs 
 	
 root "jobs#index"

end
