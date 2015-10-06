Rails.application.routes.draw do
  devise_for :admins, :skip => :registrations
  # root :to => "pages#index", :id => nil
  root 'pages#index'
  get 'pages/experience' => 'pages#experience', as: :experience
  get 'pages/gallery' => 'pages#gallery', as: :gallery
  get 'pages/about' => 'pages#about', as: :about
  get 'pages/join' => 'pages#join', as: :join
  get 'pages/logic' => 'pages#phonenumber_logic', as: :logic
  get 'pages/thank_you/:id' => 'pages#thank_you', as: :thank_you

  resources :users, only: [:new, :create, :destroy] do
    member do
      post 'drive_upload'
    end
  end

  resources :admins, only: [:index] do
    member do
      get 'show_text_conversations' => 'twilio#show_text_conversations'
    end
  end

  get 'pictures/new/:id' => 'pictures#new', as: :new_picture
  post 'pictures/upload' => 'pictures#upload', as: :upload_picture

  get 'pictures/modified/new/:user_id/:picture_id' => 'pictures#new_modified', as: :new_modified_picture

  get 'quickstart/:id' => 'twilio#quickstart', as: :quickstart
  get 'twilio/new/:id' => 'twilio#new', as: :twilio_new
  post 'twilio/send/:id' => 'twilio#send_message', as: :send_message
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
