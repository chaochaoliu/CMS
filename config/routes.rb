Rails.application.routes.draw do
  resources :suggestions
  resources :notifications
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations"  }
  resources :event_sermon_reflections
  resources :event_sermons

  resources :event_notices
  resources :sermon_sign_ins
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
  resources :event_registrations
  resources :news_comments

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  
  root 'main#index'

  get 'welcome' => 'welcome#index', :as => 'welcome'
  get 'bbs' => 'bbs#index', :as => 'bbs'
  get 'my_events' => 'events#my_events', :as => 'my_events'
  get 'event_detail' => 'events#event_detail', :as => 'event_detail'
  get 'calendar' => 'events#calendar', :as => 'calendar'
  get 'my_reflections' => 'sermon_reflections#my_reflections', :as => 'my_reflections'
  get 'thank_you' => 'suggestions#thank_you_for_suggestion', :as => 'thank_you_for_suggestion'
  get 'thank_you_news' => 'news#thank_you_for_submitting_news', :as => 'thank_you_for_submitting_news'
  get 'service_review' => 'news#service_review', :as => 'service_review'
  get 'good_news' => 'news#good_news', :as => 'good_news'
  get 'testimony' => 'news#testimony', :as => 'testimony'
  get 'sunday_service' => 'sermons#sunday_service', :as => 'sunday_service'
  get 'morning_service' => 'sermons#morning_service', :as => 'morning_service'
  get 'wednesday_service' => 'sermons#wednesday_service', :as => 'wednesday_service'
  get 'other_service' => 'sermons#other_service', :as => 'other_service'
 
  get 'prayer_meeting' => 'sermons#prayer_meeting', :as => 'prayer_meeting'
  get 'my_sermon_reflections' => 'sermon_reflections#my_sermon_reflections', :as => 'my_sermon_reflections'
  get 'my_event_sermon_reflections' => 'event_sermon_reflections#my_event_sermon_reflections', :as => 'my_event_sermon_reflections'
  get 'recent_good_news' => 'news#recent_good_news', :as => 'recent_good_news'
  get 'recent_testimony' => 'news#recent_testimony', :as => 'recent_testimony'
  get 'recent_sunday_service' => 'news#recent_sunday_service', :as => 'recent_sunday_service'




 
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
