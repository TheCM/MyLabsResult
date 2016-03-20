class Result < ActiveRecord::Base
  belongs_to :results_for_users
  belongs_to :type_of_examinations
  belongs_to :type_of_tissues
  validates :type_of_tissue_id, presence: true
  validates :type_of_examination_id, presence: true
  validates :description, presence: true

end
