require 'rails_helper'

RSpec.describe Wiki, type: :model do
  it { should belong_to :user }
  it { should have_many(:collaboration_users).through(:collaborations) }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :title }
end
