class User < ApplicationRecord
  enum role: [:admin, :volunteer]
  after_initialize :set_default_role, :if => :new_record?
  has_many :volunteerships
  has_many :volunteering_projects, through: :volunteerships, source: :project

  mount_uploader :avatar, AvatarUploader

  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_integrity_of  :avatar
  validates_processing_of :avatar
  validates :mobile, presence: true, length: { is: 10 }
  validates_format_of :mobile, with: /\A\d{10}\z/
  def set_default_role
    self.add_role :volunteer
  end

end
