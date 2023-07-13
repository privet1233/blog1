
Rails.application.routes.draw do
  #get 'pages/home'
  root "articles#index" 

 devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' },         controllers: {registration: 'users/registration'}

  
  
    resources :articles, param: :slug do
    resources :comments
  end
end




