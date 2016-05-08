class Labs::ViewController < ApplicationController
  before_action :authenticate_lab!

  def my_workers
    @workers = Worker.where(lab_id: current_lab.id, is_active: true)
  end

  def my_fired_workers
    @workers = Worker.where(lab_id: current_lab.id, is_active: false)
  end

  def worker_result_list
    @resultsforuser = ResultsForUser.where(worker_id: params['worker_id'])
    @worker = Worker.find(params['worker_id'])
  end

  def search_patients
  end

  def patients
    if params['lastname'] != ''
      @users = User.where(last_name: params['lastname'])
    elsif params['identifier'] != ''
      @users =  User.where(identifier: params['identifier'])
    else
      @users = User.all
    end

    if @users == []
      redirect_to labs_view_search_patients_path, alert: "Users were not found"
    end
  end
end
