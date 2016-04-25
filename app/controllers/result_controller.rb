class ResultController < ApplicationController
  def show
    id = params['result_id']
    @result = Result.find(id)
    @result_photos_count = @result.result_attachments.all.count
    @result_photos = @result.result_attachments.all
    @tissue = TypeOfTissue.find(@result.type_of_tissue_id).tissue
    @examination = TypeOfExamination.find(@result.type_of_examination_id).examination
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

  def user_search_form

  end

  def user_search_list
    if params['lastname'] != ''
      @users = User.where(last_name: params['lastname'])
    elsif params['identifier'] != ''
      @users =  User.where(identifier: params['identifier'])
    else
      @users = User.all
    end

    if @users == []
      redirect_to result_user_search_form_path, alert: "User was not found"
    end

  end

  def user_search_result_form

  end

  def user_search_result_list
    if params['lastname'] != ''
      @users = User.where(last_name: params['lastname'])
    elsif params['identifier'] != ''
      @users =  User.where(identifier: params['identifier'])
    else
      @users = User.all
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
