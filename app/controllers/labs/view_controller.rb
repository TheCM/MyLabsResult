class Labs::ViewController < ApplicationController
  before_action :authenticate_lab!

  def my_workers
    @workers = Worker.where(lab_id: current_lab.id)
  end

  def worker_result_list
    @resultsforuser = ResultsForUser.where(worker_id: params['worker_id'])
    @worker = Worker.find(params['worker_id'])
  end
end
