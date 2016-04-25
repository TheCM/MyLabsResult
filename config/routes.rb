Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"



  devise_for :admins, controllers: { registrations: "admins/registrations" }
  devise_for :workers, controllers: { registrations: "workers/registrations" }
  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_for :labs, controllers: { registrations: "labs/registrations" }

  root 'main_site#main'

  get 'main_site/main'

  get 'labs/view/my_workers'
  get 'labs/view/worker_result_list'

  get 'users/view/my_results'

  get 'workers/view/my_results'

  get 'admins/view/results_for_users'

  get 'result/show'
  get 'result/new'
  post 'result/create'
  get 'result/user_search_form'
  post 'result/user_search_list'
  get 'result/user_search_result_form'
  post 'result/user_search_result_list'

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
