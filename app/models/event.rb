class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true

  belongs_to :project
  mount_uploader :image, ImageUploader

  # For mapping user to a resource we resourcify a model - authorization purpose
  resourcify

end
