Rails.application.routes.draw do

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # post '/rate' => 'rater#create', :as => 'rate'

  get '/users' => 'users/list#call', as: :users
  get '/users/:id' => 'users/show#call', as: :user
  patch '/users/:id' => 'users/update#call'
  delete '/users/:id' => 'users/destroy#call'
  get '/users/:id/edit' => 'users/edit#call', as: :edit_user

  # resources :users, :except => [:new, :create]

  get '/book/:id' => 'recipes/list#call', as: :recipes
  post '/recipes' => 'recipes/create#call', as: :create_recipe
  get '/recipes/new' => 'recipes/new#call', as: :new_recipe
  get '/recipes/import' => 'recipes/import#call', as: :import_recipe
  post '/recipes/import' => 'recipes/import#call'
  get '/recipes/:id' => 'recipes/show#call', as: :recipe
  patch '/recipes/:id' => 'recipes/update#call'
  delete '/recipes/:id' => 'recipes/destroy#call'
  get '/recipes/:id/edit' => 'recipes/edit#call', as: :edit_recipe

  # resources :books, only: [:show], shallow: true do
  #   resources :recipes
  #   resources :import_recipe, :only => [:index, :create]
  # end

  get '/categories' => 'categories/list#call', as: :categories
  post '/categories' => 'categories/create#call'
  get '/categories/new' => 'categories/new#call', as: :new_category
  get '/categories/:id' => 'categories/show#call', as: :category
  patch '/categories/:id' => 'categories/update#call'
  delete '/categories/:id' => 'categories/destroy#call'
  get '/categories/:id/edit' => 'categories/edit#call', as: :edit_category
  get '/categories/:id/classification/search' => 'categories/classification_search#call', as: :search_classification_category
  post '/categories/:id/classification' => 'categories/classification_add#call', as: :add_classification_category
  delete '/categories/:id/classification' => 'categories/classification_remove#call', as: :remove_classification_category

  # resources :categories

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
