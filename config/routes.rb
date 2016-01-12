Rails.application.routes.draw do
    #devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  
#  
#  as :organization do
#    get    'organization/login'   => 'organizations/sessions#new'
#    post   'organization/login'   => 'organizations/sessions#create'
#    delete 'organization/logout'  => 'organizations/sessions#destroy'
#  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'catalog#index'
  get '/'           => 'catalog#index'
  devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  devise_for :organizations, controllers: {:sessions=>'organizations/sessions',:registrations =>'organizations/registrations'}
  devise_for :users, controllers: {:sessions => 'users/sessions', :confirmations => 'users/confirmations',:registrations =>'users/registrations'} 

  scope '/admin' do
    as :admin do
      get '/'           => 'admins/admins#index'
      get    '/login'   => 'admins/sessions#new'
      post   '/login'   => 'admins/sessions#create'
      delete '/logout'  => 'admins/sessions#destroy'
    end
    get     '/admins' => 'admins/admins#index'
    resources :organizations do
      resources :products
    end
    resources :products    
  end
  
  as :user do
    get    '/login'   => 'users/sessions#new'
    post   '/login'   => 'users/sessions#create'
    delete '/logout'  => 'users/sessions#destroy'
  end
  
  
  resources :catalog

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
