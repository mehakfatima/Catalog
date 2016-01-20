Rails.application.routes.draw do
  
  root 'catalog/products#index'
  get '/users'           => 'catalog/products#index'
  devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  devise_for :organizations, controllers: {:sessions=>'organizations/sessions'}
  devise_for :users, controllers: {:sessions => 'users/sessions', :confirmations => 'users/confirmations',:registrations =>'users/registrations'} 

  scope '/admin' do
    as :admin do
      get '/'           => 'admins/admins#index'
      get    '/login'   => 'admins/sessions#new'
      post   '/login'   => 'admins/sessions#create'
      delete '/logout'  => 'admins/sessions#destroy'
    end
    
    resources :categories
    resources :catalog
    resources :products    
  end
  
    namespace :admins do
      resources :organizations do
        resources :products
     end   
      resources :dashboard
    end
    
  namespace :organizations do
    resources :products
    resources :categories
    resources :dashboard
  end

  scope '/organization' do
    as :organization do
      get    '/login'   => 'organizations/sessions#new'
      post   '/login'   => 'organizations/sessions#create'
      delete '/logout'  => 'organizations/sessions#destroy'
    end    
  end
  
  as :user do
    get    '/login'   => 'users/sessions#new'
    post   '/login'   => 'users/sessions#create'
    delete '/logout'  => 'users/sessions#destroy'
  end
  
  
  namespace :catalog do
    resources :products
  end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
