class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :rememberable, :trackable, :confirmable, :recoverable, 
  devise :database_authenticatable, :registerable, :validatable
  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note

  enum role: [:normal, :moderator, :admin]

  # after_initialize :set_default_user_role
  #
  # def set_default_user_role
  #    self.role = :normal
  # end
end
