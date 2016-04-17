class Workers::ViewController < ApplicationController
  before_action :authenticate_worker!

  def my_results
    @resultsforuser = ResultsForUser.where(worker_id: current_worker.id)
  end
end
