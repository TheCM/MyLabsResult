class ResultsForUser < ActiveRecord::Base
  validates :user_id, presence: true
  validates :worker_id, presence: true
  validates :result_id, presence: true

end
