require 'carrierwave/orm/activerecord'

class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :is_active, presence: true
  validates :image, presence: true
  validates :location, presence: true
  serialize :specifications, ProjectSpecifications

  has_many :volunteerships
  has_many :volunteers, through: :volunteerships, source: :user
  mount_uploader :image, ImageUploader

  # For mapping user to a resource we resourcify a model
  resourcify

  scope :close_to, -> (latitude, longitude, distance_in_meters = 2000) {
    where(%{
      ST_Distance(location, ST_WKTToSQL('POINT (%f %f)')) < %d
    } % [latitude, longitude, distance_in_meters])
  }
end
