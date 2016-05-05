class Admins::ViewController < ApplicationController
  before_action :authenticate_admin!

  def results_for_users
    @resultsforuser = ResultsForUser.all
  end

  def all_results
    if params['worker_id']
      @resultsforuser = ResultsForUser.where(worker_id: params['worker_id'])
      @results ||= []
      @resultsforuser.each do |rfu|
        @results << Result.find(rfu.result_id)
      end
    else
      @results = Result.all
    end
  end

  def view_labs
    @labs = Lab.all
  end

  def view_workers
    if params['lab_id']
      @workers = Worker.where(lab_id: params['lab_id'])
    else
      @workers = Worker.all
    end
  end

  def view_users
    @users = User.all
  end

  def view_admins
    @admins = Admin.all
  end

end
