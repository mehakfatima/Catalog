Rails.application.routes.draw do
  devise_for :admins, controllers: {:sessions => 'admins/sessions', :confirmations => 'admins/confirmations'} 
  devise_for :organizations, controllers: {:sessions=>'organizations/sessions'}
  devise_for :users, controllers: {:sessions => 'users/sessions', :confirmations => 'users/confirmations'} 
  
   as :user do
    get    '/login'   => 'users/sessions#new'
    post   '/login'   => 'users/sessions#create'
    delete '/logout'  => 'users/sessions#destroy'
  end

     as :admin do
    get    'admin/login'   => 'admins/sessions#new'
    post   'admin/login'   => 'admins/sessions#create'
    delete 'admin/logout'  => 'admins/sessions#destroy'
  end

     as :organization do
    get    'organization/login'   => 'organizations/sessions#new'
    post   'organization/login'   => 'organizations/sessions#create'
    delete 'organization/logout'  => 'organizations/sessions#destroy'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

     resources :products


 
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :welcome

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

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