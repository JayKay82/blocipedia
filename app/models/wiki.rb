# A Model for Blocipedia's wikis
class Wiki < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true

  default_scope { order('created_at DESC') }

  def readable_by?(this_user)
    (self.private && this_user.premium?) || (self.private == nil)
  end
end
