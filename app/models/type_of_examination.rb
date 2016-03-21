class TypeOfExamination < ActiveRecord::Base
  validates :examination, presence: true
end
