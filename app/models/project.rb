require 'carrierwave/orm/activerecord'

class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :is_active, presence: true
  validates :image, presence: true
  validates :location, presence: true
  store_accessor :specifications

  has_many :volunteerships
  has_many :volunteers, through: :volunteerships, source: :user
  has_many :events

  mount_uploader :image, ImageUploader

  enum status: { yet_to_start: 0, in_progress: 1, completed: 2 }

  # For mapping user to a resource we resourcify a model - authorization purpose
  resourcify

  scope :close_to, -> (latitude, longitude, distance_in_meters = 2000) {
    where(%{
      ST_Distance(location, ST_WKTToSQL('POINT (%f %f)')) < %d
    } % [latitude, longitude, distance_in_meters])
  }
end
