Rails.application.routes.draw do

  root 'landing#index'

  get 'profile', :to => "access#menu"

  get 'access/menu'

  get 'access/login'

  post 'access/attempt_login'

  get 'access/logout'

  get 'landing/index'

  get 'comments/index'

  get 'comments/show'

  get 'comments/new'

  get 'comments/delete'

  #get 'posts/index'

  #get 'posts/show'

  #get 'posts/new'

 # get 'posts/edit'

  #et 'posts/delete'

  #get 'groups/index'

  #get 'groups/show'

  #get 'groups/new'

  #get 'groups/edit'

  #get 'groups/delete'

  
  # patch '/users', to: 'users#show'
  



  resources :users do
    member do
      get :delete
    end
  end

  resources :posts do
    member do
      get :delete
    end
  end

  resources :groups do
    member do
      get :delete
    end
  end

  # get ":controller(/:action(/:id))"
  # get 'users/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
