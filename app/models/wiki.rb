# A Model for Blocipedia's wikis
class Wiki < ActiveRecord::Base
  belongs_to :user # The user who created this wiki

  has_many :collaborations
  has_many :collaboration_users, through: :collaborations, source: :user # The users who collorate on this wiki

  validates :user_id, presence: true
  validates :title, presence: true

  default_scope { order('created_at DESC') }

  def readable_by?(this_user)
    (self.private && (self.user == this_user || self.collaboration_users.include?(this_user))) || (self.private == nil)
  end
end
