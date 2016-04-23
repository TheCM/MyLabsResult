class Result < ActiveRecord::Base
  has_many :result_attachments
  accepts_nested_attributes_for :result_attachments
  belongs_to :type_of_examinations
  belongs_to :type_of_tissues
  validates :type_of_tissue_id, presence: true
  validates :type_of_examination_id, presence: true
  validates :description, presence: true

end
