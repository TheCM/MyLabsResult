Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"



  devise_for :admins, controllers: { registrations: "admins/registrations" }
  devise_for :workers, controllers: { registrations: "workers/registrations", sessions: "workers/sessions" }
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  devise_for :labs, controllers: { registrations: "labs/registrations", sessions: "labs/sessions" }

  root 'main_site#main'

  get 'main_site/main'

  get 'labs/view/my_workers'
  get 'labs/view/my_fired_workers'
  get 'labs/view/worker_result_list'
  post 'labs/view/patients'
  get 'labs/view/search_patients'

  get 'users/view/my_results'

  get 'workers/view/my_results'
  get 'workers/view/labs_workers'
  get 'workers/view/my_labs_results'

  get 'admins/view/results_for_users'
  get 'admins/view/all_results'
  get 'admins/view/view_labs'
  get 'admins/view/view_workers'
  get 'admins/view/view_users'
  get 'admins/view/view_admins'

  delete 'result/delete'
  delete 'result/delete_picture'
  get 'result/edit'
  get 'result/new'
  get 'result/show'
  get 'result/user_search_form'
  get 'result/user_search_result_form'
  get 'result/change_user'
  post 'result/update_user'
  post 'result/create'
  post 'result/update'
  post 'result/update_user_list'
  post 'result/user_search_list'
  post 'result/user_search_result_list'
  post 'result/add_picture'

  get 'accounts/my_profile'
  get 'accounts/view_profile'
  get 'accounts/edit_profile'
  post 'accounts/update_profile'
  get 'accounts/activate_account'
  get 'accounts/deactivate_account'

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
