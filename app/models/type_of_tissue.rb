class TypeOfTissue < ActiveRecord::Base
  validates :tissue, presence: true
  validates :translation, presence: true
end
