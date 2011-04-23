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
  root :to => "welcome#index"
end
