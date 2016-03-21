class ResultsForUser < ActiveRecord::Base
  belongs_to :results
  belongs_to :workers
  belongs_to :users
  validates :user_id, presence: true
  validates :worker_id, presence: true
  validates :result_id, presence: true

end
