class Labs::ViewController < ApplicationController
  before_action :authenticate_lab!

  def my_workers
    @workers = Worker.where(lab_id: current_lab.id)
  end
end
