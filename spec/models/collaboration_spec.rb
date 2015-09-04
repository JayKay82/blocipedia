require 'rails_helper'

RSpec.describe Collaboration, type: :model do
  it { should belong_to :wiki }
  it { should belong_to :user }
end
