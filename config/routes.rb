Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

  get    'home' => 'pages#home'
  get    'index' => 'pages#index'
    
  get    'signin'   => 'users#new'
  post   'signin'   => 'users#create'
  get    'aventuriers'   => 'users#users_list'
  get    'aventuriers/:pseudo'   => 'users#user_profil', as: :user
  resources :users, only: [:new, :create], path: "aventuriers"
    
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy'

  resources :posts, only: [:new, :create, :show], path: "quetes" do
    resources :comments, only: [:create, :destroy], path: "participations"
    get 'validate_comment/:id' => 'comments#validate_comment', as: 'validate_comment'
  end
end
