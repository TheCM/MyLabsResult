class Workers::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     @labs = Lab.all
     super
   end

  # POST /resource
   def create
     if workers_params[:password] == workers_params[:password_confirmation]
       if !current_admin
         worker = Worker.new(workers_params)
         worker[:lab_id] = current_lab.id
         worker.save!
       else
         worker = Worker.new(workers_params_for_admin)
         worker.save!
       end
       redirect_to root_path, notice: "worker created!"
     else
       redirect_to request.referer, alert: "Password confirmation not correct!"
     end
   end


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  def workers_params
    params.require(:worker).permit(:email, :password, :password_confirmation, :first_name, :last_name, :pesel, :sex)
  end

  def workers_params_for_admin
    params.require(:worker).permit(:email, :password, :password_confirmation, :first_name, :last_name, :pesel, :lab_id, :sex)
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
