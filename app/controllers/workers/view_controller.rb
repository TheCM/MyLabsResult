class Workers::ViewController < ApplicationController
  before_action :authenticate_worker!

  def my_results
    if params['user_id']
      @resultsforuser = ResultsForUser.where(worker_id: current_worker.id, user_id: params['user_id'])
    else
      @resultsforuser = ResultsForUser.where(worker_id: current_worker.id)
    end
  end
end
