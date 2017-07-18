require 'carrierwave/orm/activerecord'

class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :is_active, presence: true
  mount_uploader :image, ImageUploader
end
