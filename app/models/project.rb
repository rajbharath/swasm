require 'carrierwave/orm/activerecord'

class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :is_active, presence: true
  validates :image, presence: true
  validates :location, presence: true
  mount_uploader :image, ImageUploader
end
