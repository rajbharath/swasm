class Project < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :is_active, presence: true
end
