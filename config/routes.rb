Rails.application.routes.draw do
  resources :song_instances, only: [:create, :update] do
    delete :index, on: :collection, action: :destroy
    put :move_up, on: :member, action: :move_up
    put :move_down, on: :member, action: :move_down
  end
  resources :gig_sets, only: [:create, :update, :destroy]
  resources :gigs, except: :show
  resources :songs, except: :show
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  devise_scope :user do
    get 'users', to: 'users/registrations#index'
    put 'users/:id/toggle_approved', to: 'users/registrations#toggle_approved', as: 'toggle_user'
    delete 'users/:id', to: 'users/registrations#destroy_other', as: 'destroy_other_user'
  end

  root 'songs#index'
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
