class Admins::ViewController < ApplicationController
  before_action :authenticate_admin!

  def results_for_users
    @resultsforuser = ResultsForUser.all
  end

  def all_results
    @results = Result.all
  end
end
