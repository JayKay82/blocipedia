# Model for Devise User
class User < ActiveRecord::Base
  has_many :wikis

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
