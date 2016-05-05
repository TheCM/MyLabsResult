class Users::SessionsController < Devise::SessionsController
 before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

 #  POST /resource/sign_in
   def create
    @user = User.find_by(email: params['user']['email']) rescue nil
    if @user && @user.is_active
      super
    elsif !@user
      redirect_to new_user_session_path, notice: 'Invalid email or password.'
    else
      redirect_to new_user_session_path, notice: 'You are not active.'
    end
   end

 #  DELETE /resource/sign_out
   def destroy
     super
   end

   protected

 #  If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.for(:sign_in) << :attribute
   end
end
