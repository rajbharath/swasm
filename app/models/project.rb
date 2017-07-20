require 'carrierwave/orm/activerecord'

class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :is_active, presence: true
  validates :image, presence: true
  validates :location, presence: true

  mount_uploader :image, ImageUploader

  resourcify

  scope :close_to, -> (latitude, longitude, distance_in_meters = 2000) {
    where(%{
      ST_Distance(location, ST_WKTToSQL('POINT (%f %f)')) < %d
    } % [latitude, longitude, distance_in_meters])
  }
end
