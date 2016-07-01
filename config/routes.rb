Rails.application.routes.draw do

  resources :sermon_reflections
  resources :sermons
  get 'comments/new'

  get 'comments/create'

  get 'comments/index'

  get 'comments/edit'

  resources :news
  get 'reflections/new'

  get 'reflections/create'

  get 'reflections/edit'

  resources :messages
  resources :events
  resources :registrations
  resources :reflections
  resources :comments

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations"  }
  
  root 'main#index'

  get 'welcome' => 'welcome#index', :as => 'welcome'
  get 'bbs' => 'bbs#index', :as => 'bbs'



 
  # resources 'roles'

  get 'profiles/new' => 'profiles#new', :as => 'new_profile'
  get 'profiles/:id/edit' => 'profiles#edit', :as => 'edit_profile'
  get 'profiles/:id' => 'profiles#show', :as => 'profile'
  
  post 'profiles' => 'profiles#create'
  put 'profiles/:id' => 'profiles#update'
  patch 'profiles/:id' => 'profiles#update'


 # bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete


  resources "messages"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
