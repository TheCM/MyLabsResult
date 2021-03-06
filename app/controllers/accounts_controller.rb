class AccountsController < ApplicationController

  def my_profile
  end

  def view_profile
    if params['lab_id']
      @lab = Lab.find(params['lab_id'])
    elsif params['worker_id']
      @worker = Worker.find(params['worker_id'])
    elsif params['user_id']
      @user = User.find(params['user_id'])
    elsif params['admin_id']
      @admin = Admin.find(params['admin_id'])
    else
      redirect_to root_path, notice: "No parameters"
    end
  end

  def edit_profile
    user_id = params['user_id']
    worker_id = params['worker_id']
    lab_id = params['lab_id']
    admin_id = params['admin_id']
    if user_id && ((current_user && current_user == user_id) || current_lab || current_admin)
      @user = User.find(user_id)
    elsif worker_id && ((current_worker && current_worker.id == worker_id) || (current_lab && Worker.find(worker_id).lab_id == current_lab.id) || current_admin)
      @worker = Worker.find(worker_id)
      @labs = Lab.where(is_active: true)
    elsif lab_id && ((current_lab && current_lab.id == lab_id) || current_admin)
      @lab = Lab.find(lab_id)
    elsif admin_id && current_admin
      @admin = Admin.find(admin_id)
    else
      redirect_to root_path, notice: "Access denied or inapropriate data."
    end
  end

  def update_profile
    if params['user']
      if ((current_user && current_user == params['user']['id']) || current_lab || current_admin)
        @user = User.find(params['user']['id'])
        @user.assign_attributes(user_params)
        if current_admin || current_lab
          @user.assign_attributes(identifier: params['user']['identifier'])
        end
        if !@user.valid?
          @errors = ''
          @user.errors.messages.each do |key, value|
            @errors += key.to_s + " " + value[0] + " | "
          end
          redirect_to :back, notice: @errors
        else
          if params['user']['new_password'] != ""
            if (!current_user || @user.valid_password?(params['user']['current_password'])) && (params['user']['new_password'] == params['user']['confirm_password']) && (params['user']['new_password'].length >= 6)
              @user.password = params['user']['new_password']
              @user.save!
              redirect_to :back, notice: 'Profile and password updated successfully'
            else
              redirect_to :back, notice: 'Incorrect password'
            end
          else
            @user.save
            redirect_to :back, notice: 'Profile updated successfully'
          end
        end
      else
        redirect_to root_path, notice: 'No parameters or access denied'
      end
    elsif params['worker']
      if (current_worker && current_worker.id == worker_id) || (current_lab && Worker.find(params['worker']['id']).lab_id == current_lab.id) || current_admin
        @worker = Worker.find(params['worker']['id'])
        @worker.assign_attributes(worker_params)
        if current_admin || (current_lab && current_lab.id == @worker.lab_id)
          @worker.assign_attributes(identifier: params['worker']['identifier'])
        end
        if !@worker.valid?
          @errors = ''
          @worker.errors.messages.each do |key, value|
            @errors += key.to_s + " " + value[0] + " | "
          end
          redirect_to :back, notice: @errors
        else
          if params['worker']['new_password'] != ""
            if (!current_worker || @worker.valid_password?(params['worker']['current_password'])) && (params['worker']['new_password'] == params['worker']['confirm_password']) && (params['worker']['new_password'].length >= 6)
              @worker.password = params['worker']['new_password']
              @worker.save!
              redirect_to :back, notice: 'Profile and password updated successfully'
            else
              redirect_to :back, notice: 'Incorrect password'
            end
          else
            @worker.save
            redirect_to :back, notice: 'Profile updated successfully'
          end
        end
      else
        redirect_to root_path, notice: 'No parameters or access denied'
      end
    elsif params['lab']
      if (current_lab && current_lab.id == lab_id) || current_admin
        @lab = Lab.find(params['lab']['id'])
        @lab.assign_attributes(lab_params)
        if !@lab.valid?
          @errors = ''
          @lab.errors.messages.each do |key, value|
            @errors += key.to_s + " " + value[0] + " | "
          end
          redirect_to :back, notice: @errors
        else
          if params['lab']['new_password'] != ""
            if (!current_lab || @lab.valid_password?(params['lab']['current_password'])) && (params['lab']['new_password'] == params['lab']['confirm_password']) && (params['lab']['new_password'].length >= 6)
              @lab.password = params['lab']['new_password']
              @lab.save!
              redirect_to :back, notice: 'Profile and password updated successfully'
            else
              redirect_to :back, notice: 'Incorrect password'
            end
          else
            @lab.save
            redirect_to :back, notice: 'Profile updated successfully'
          end
        end
      end
    elsif params['admin']
      if current_admin
        @admin = Admin.find(params['admin']['id'])
        @admin.assign_attributes(admin_params)
        if !@admin.valid?
          @errors = ''
          @admin.errors.messages.each do |key, value|
            @errors += key.to_s + " " + value[0] + " | "
          end
          redirect_to :back, notice: @errors
        else
          if params['admin']['new_password'] != ""
            if (params['admin']['new_password'] == params['admin']['confirm_password']) && (params['admin']['new_password'].length >= 6)
              @admin.password = params['admin']['new_password']
              @admin.save!
              redirect_to :back, notice: 'Profile and password updated successfully'
            else
              redirect_to :back, notice: 'Incorrect password'
            end
          else
            @admin.save
            redirect_to :back, notice: 'Profile updated successfully'
          end
        end

      end
    else
      redirect_to root_path, notice: 'No parameters or access denied'
    end
  end

  def deactivate_account
    if current_admin || current_lab
      if params['user_id']
        @user = User.find(params['user_id'])
        @user.is_active = false
        @user.save!
        redirect_to :back, notice: 'User has been deactivated'
      elsif params['worker_id']
        @worker = Worker.find(params['worker_id'])
        if current_admin || (current_lab && current_lab.id == @worker.lab_id)
          @worker.is_active = false
          @worker.save!
          redirect_to :back, notice: 'Worker has been deactivated'
        else
          redirect_to :back, notice: 'You cannot deactivate this worker'
        end
      elsif params['lab_id']
        if current_admin
          @lab = Lab.find(params['lab_id'])
          @lab.is_active = false
          @lab.save!
          redirect_to :back, notice: 'Lab has been deactivated'
        else
          redirect_to :back, notice: 'You cannot deactivate labs'
        end
      else
        redirect_to :back, notice: 'No account has found'
      end
    else
      redirect_to :back, notice: 'Access denied'
    end
  end

  def activate_account
    if current_admin || current_lab
      if params['user_id']
        @user = User.find(params['user_id'])
        @user.is_active = true
        @user.save!
        redirect_to :back, notice: 'User has been activated'
      elsif params['worker_id']
        @worker = Worker.find(params['worker_id'])
        if current_admin || (current_lab && current_lab.id == @worker.lab_id)
          @worker.is_active = true
          @worker.save!
          redirect_to :back, notice: 'Worker has been activated'
        else
          redirect_to :back, notice: 'You cannot activate this worker'
        end
      elsif params['lab_id']
        if current_admin
          @lab = Lab.find(params['lab_id'])
          @lab.is_active = true
          @lab.save!
          redirect_to :back, notice: 'Lab has been activated'
        else
          redirect_to :back, notice: 'You cannot activate labs'
        end
      else
        redirect_to :back, notice: 'No account has found'
      end
    else
      redirect_to :back, notice: 'Access denied'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :sex)
  end
  def worker_params
    params.require(:worker).permit(:email, :first_name, :last_name, :sex, :lab_id)
  end
  def lab_params
    params.require(:lab).permit(:email, :name, :description)
  end
  def admin_params
    params.require(:admin).permit(:email)
  end
end
