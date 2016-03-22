class Users::ViewController < ApplicationController
  before_action :authenticate_user!

  def my_results
    @resultsforuser = ResultsForUser.where(user_id: current_user.id)
  end
end
