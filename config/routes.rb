Rails.application.routes.draw do

  devise_for :users
  post '/rate' => 'rater#create', :as => 'rate'
  resources :users
  resources :recipes

  get '/admin' => 'dish_types#index'
  
  resources :dish_types, path: '/admin/dish_types', :except => [:show] do
    get 'move_higher', on: :member
    get 'move_lower', on: :member
  end
  resources :dish_types, path: '/admin/dish_types', :only => [:show], :defaults => { :format => 'json' }
  
  resources :categories, path: '/admin/categories', :except => [:show]
  resources :categories, path: '/admin/categories', :only => [:show], :defaults => { :format => 'json' }
  
  resources :ingredients, path: '/admin/ingredients', :except => [:show]
  resources :ingredients, path: '/admin/ingredients', :only => [:show], :defaults => { :format => 'json' }
  
  resources :sources, path: '/admin/sources', :except => [:show]
  resources :sources, path: '/admin/sources', :only => [:show], :defaults => { :format => 'json' }

  root :to => "welcome#index"
  
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
