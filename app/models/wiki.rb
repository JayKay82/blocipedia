# A Model for Blocipedia's wikis
class Wiki < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true

  default_scope { order('created_at DESC') }

  def readable_by?(this_user)
    (self.private && this_user.premium? && self.user == this_user) || (self.private == nil)
  end

  def downgrade_wikis(user)
    self.where(user: user).each do |wiki|
      wiki.private = nil
      wiki.save
    end
  end
end
