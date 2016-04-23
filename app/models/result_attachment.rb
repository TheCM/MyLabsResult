class ResultAttachment < ActiveRecord::Base
  mount_uploader :picture, MedicalPicturesUploader
  belongs_to :result
end
