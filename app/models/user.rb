class User < ApplicationRecord
  enum role: [:admin, :volunteer]
  after_initialize :set_default_role, :if => :new_record?

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def set_default_role
    self.add_role :volunteer
  end

end
