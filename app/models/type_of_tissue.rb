class TypeOfTissue < ActiveRecord::Base
  has_many :results
  validates :tissue, presence: true
  validates :translation, presence: true
end
