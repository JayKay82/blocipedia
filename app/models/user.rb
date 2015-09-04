# Model for Devise User
class User < ActiveRecord::Base
  has_many :wikis # User's personally created wikis

  has_many :collaborations
  has_many :collaboration_wikis, through: :collaborations, source: :wiki # Wikis the user collaborates on

  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def premium?
    premium_at.present?
  end

  def admin?
    %w(
      admin@example.com
    ).include?(email)
  end

end
