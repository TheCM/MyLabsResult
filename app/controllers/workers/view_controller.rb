class Workers::ViewController < ApplicationController
  before_action :authenticate_worker!

  def my_results
    if params['user_id']
      @resultsforuser = ResultsForUser.where(worker_id: current_worker.id, user_id: params['user_id'])
    else
      @resultsforuser = ResultsForUser.where(worker_id: current_worker.id)
    end
  end

  def my_labs_results
    if current_worker
      if params['worker_id']
        @worker = Worker.find(params['worker_id'])
        if @worker.lab_id == current_worker.lab_id
          @resultsforuser = ResultsForUser.where(worker_id: params['worker_id'])
        else
          redirect_to :back, notice: 'Access denied!'
        end
      else
        redirect_to :back, notice: 'Choose your coworker'
      end
    else
      redirect_to :back, notice: 'Access denied!'
    end
  end

  def labs_workers
    if current_worker
      @workers = Worker.where(lab_id: current_worker.lab_id)
    else
      redirect_to :back, notice: 'Access denied!'
    end
  end
end
