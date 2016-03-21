class Result < ActiveRecord::Base
  validates :type_of_tissue_id, presence: true
  validates :type_of_examination_id, presence: true
  validates :description, presence: true

end
