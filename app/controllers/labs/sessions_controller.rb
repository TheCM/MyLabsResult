class Labs::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    @lab = Lab.find_by(email: params['lab']['email']) rescue nil
    if @lab && @lab.is_active
      super
    elsif !@lab
      redirect_to new_lab_session_path, notice: 'Invalid email or password.'
    else
      redirect_to new_lab_session_path, notice: 'You are not active.'
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
