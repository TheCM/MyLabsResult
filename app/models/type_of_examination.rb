class TypeOfExamination < ActiveRecord::Base
  has_many :results
  validates :examination, presence: true
end
