BokuWatashi::Application.routes.draw do
  resources :sessions, :users, :wishes
  namespace 'admin' do
    resources :sessions
    resources :children do
      get 'wishes' => 'wishes#index'
      get 'wishes/:id' => 'wishes#show', :as => 'wish'
      put 'wishes/:id/approve' => 'wishes#approve', :as => 'wish_approve'
      put 'wishes/:id/reject' => 'wishes#reject', :as => 'wish_reject'
    end
  end

  get 'signup' => 'users#new', :as => 'signup'

  get 'admin_login' => 'admin/sessions#new', :as => 'admin_login'
  get 'admin_logout' => 'admin/sessions#destroy', :as => 'admin_logout'
  get 'admin_root' => 'admin/children#index', :as => 'admin_root'

  get 'child_login' => 'sessions#new', :as => 'child_login'
  get 'child_logout' => 'sessions#destroy', :as => 'child_logout'
  get 'child_root' => 'wishes#index', :as => 'child_root'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
