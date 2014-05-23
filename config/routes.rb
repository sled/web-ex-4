Rails.application.routes.draw do
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

  resources :users, controller: 'users', only: [:create, :edit]
  resource :account, controller: 'users', only: [:show, :edit, :update]

  resources :profiles, only: [:show, :index]

  resource :flickr, controller: 'flickr', only: [:show] do 
    get :search, as: :search, on: :member
  end

  resources :groups do 
    resources :events do 
      put :like, on: :member, as: :like
      put :confirm, on: :member, as: :confirm
    end
    resources :members, only: [:index] do
      post :toggle, on: :member, as: :toggle
    end
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'users#show', as: :signed_in_user
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'pages#welcome'
  end

  get '/auth/:provider/callback' => 'omniauth_callbacks#twitter'
  get '/auth/failure', to: redirect('/')
end
