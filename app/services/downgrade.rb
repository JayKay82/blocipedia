# This class takes a user object and downgrades it to a standard user.
# It returns a message object stating success or failure.
class Downgrade
  def self.make_standard(user)
    if user.update_attributes(premium_at: nil)
      user.wikis.update_all(private: nil)
      #self.new(user)
      true
    else
      false
    end
  end

  # attr_reader :user
  # def initialize(user)
  #   @user = user
  # end
  #
  # def message
  #   if user.premium?
  #     'Unable to downgrade to standard. Please try again.'
  #   else
  #     'You were successfully downgraded.'
  #   end
  # end
end
