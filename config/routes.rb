Cats::Application.routes.draw do

  resources :xclubs do
    resources :xevents
  end

  resources :tags do
    resources :likes
    resources :follows
  end

  resources :lists do
    resources :comments
    resources :likes
    resources :rates
    resources :taglinks
  end

  resources :articles do
    resources :comments
    resources :likes
    resources :rates
    resources :taglinks
    resources :links
  end

  resources :videos do
    resources :comments
    resources :likes
    resources :rates
    resources :taglinks
    resources :links
  end

  resources :books do
    resources :comments
    resources :likes
    resources :rates
    resources :taglinks
    resources :links
  end
  resources :scholars
  
  resources :comments
  resources :taglinks
  resources :links

  # static pages
  get '/editor' => 'static_pages#markdowneditor', :as => :markdowneditor
  get '/terms' => 'static_pages#terms', :as => :terms
  get '/aboutus' => 'static_pages#aboutus', :as => :aboutus
  get '/joinus' => 'static_pages#joinus', :as => :joinus
  get '/helpme' => 'static_pages#helpme', :as => :helpme

  resources :help

  #devise_for :admins

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks",:registrations => "users/registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get '/uploader' => 'uploader#index', :as => :new_uploader
  get '/search' => 'search#index', :as => :new_search
  get '/manage' => 'help#manage', :as => :help_manage
  post '/manage' => 'help#apply', :as => :help_apply
  post '/manage/xclubadmin' => 'help#xclubadmin', :as => :help_xclubadmin
  
  post '/lists/:id/sort' => 'lists#sort', :as=> :sort
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
