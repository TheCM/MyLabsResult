class ResultController < ApplicationController
  def show
    id = params['result_id']
    @result = Result.find(id)
    @result_photos_count = @result.result_attachments.all.count
    @result_photos = @result.result_attachments.all
    @tissue = TypeOfTissue.find(@result.type_of_tissue_id).tissue
    @examination = TypeOfExamination.find(@result.type_of_examination_id).examination
    @result_for_user = ResultsForUser.find_by(result_id: id)
    @worker = Worker.find(@result_for_user.worker_id)
    @lab = Lab.find(@worker.lab_id)
    @user = User.find(@result_for_user.user_id)
  end


  def new
    @result = Result.new
    @user = User.find(params['user_id'])
    @result_attachments = @result.result_attachments.build
    @tissues = TypeOfTissue.all
    @examinations = TypeOfExamination.all
  end


  def create
    # render plain: params

    @result = Result.new(result_params)

    if @result.save
      params[:result_attachments]['picture'].each do |p|
         @result_attachment = @result.result_attachments.create!(:picture => p)
      end
    else
      redirect_to result_new_path, alert: 'Cannot save your result.'
    end

    @resultsforuser = ResultsForUser.new('user_id' => params['results_for_users']['user_id'], 'result_id' => @result.id, 'worker_id' => current_worker.id).save!

    redirect_to result_show_path + '?result_id=' + @result.id.to_s, notice: 'result was successfully created.'
  end


  def edit
    @result = Result.find(params['result_id'])
    @resultforuser = ResultsForUser.find_by(result_id: params['result_id'])
    @user = User.find(@resultforuser.user_id)
    @tissues = TypeOfTissue.all
    @examinations = TypeOfExamination.all
  end


  def update
    Result.update(params['result']['id'], result_params)
    redirect_to(:back, notice: "Result successfully updated")
  end


  def change_user
  end


  def update_user
    @resultsforuser = ResultsForUser.find_by(result_id: params['result_id'])
    @resultsforuser.user_id = params['user_id']
    @resultsforuser.save!
    redirect_to result_edit_path('result_id': params['result_id']), notice: "User has been updated"
  end


  def update_user_list
    if params['lastname'] != ''
      @users = User.where(last_name: params['lastname'], is_active: true)
    elsif params['identifier'] != ''
      @users =  User.where(identifier: params['identifier'], is_active: true)
    else
      @users = User.where(is_active: true)
    end

    if @users == []
      redirect_to result_change_user_path('result[result_id]':params['result_id']), alert: "User was not found", method: 'post'
    end
  end


  def delete
    result_id = params['result_id']

    @result = Result.find(result_id)
    @resultforuser = ResultsForUser.find_by(result_id: result_id)

    @result.result_attachments.each do |ra|
      FileUtils.rm_rf(Rails.root + 'public/uploads/result_attachment/picture/' + ra.id.to_s)
      ra.delete
    end

    @result.delete
    @resultforuser.delete

    redirect_to root_path, notice: 'result succesfully deleted'
  end


  def delete_picture
    @result_attachment = ResultAttachment.find(params['result_attachment_id'])
    FileUtils.rm_rf(Rails.root + 'public/uploads/result_attachment/picture/' + @result_attachment.id.to_s)
    @result_attachment.delete
    redirect_to(:back, notice: 'picture succesfully deleted')
  end


  def add_picture
    @result = Result.find(params['result_id'])
    params[:result_attachments]['picture'].each do |p|
       @result.result_attachments.create!(:picture => p)
    end
    redirect_to(:back, notice: 'picture succesfully added')
  end


  def user_search_form
  end


  def user_search_list
    if params['lastname'] != ''
      @users = User.where(last_name: params['lastname'], is_active: true)
    elsif params['identifier'] != ''
      @users =  User.where(identifier: params['identifier'], is_active: true)
    else
      @users = User.where(is_active: true)
    end

    if @users == []
      redirect_to result_user_search_form_path, alert: "User was not found"
    end
  end


  def user_search_result_form
  end


  def user_search_result_list
    if params['lastname'] != ''
      @users = User.where(last_name: params['lastname'], is_active: true)
    elsif params['identifier'] != ''
      @users =  User.where(identifier: params['identifier'], is_active: true)
    else
      @users = User.where(is_active: true)
    end

    if @users == []
      redirect_to result_user_search_result_form_path, alert: "User was not found"
    end
  end


  private
  def result_params
    params.require(:result).permit('type_of_tissue_id', 'type_of_examination_id', 'description', 'diagnosis')
  end
end
