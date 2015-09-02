require 'rails_helper'

RSpec.describe "Downgrade To Standard Account", type: :request do
  include WikiSteps

  feature %(As a user I want to
            downgrade to a standard account) do
    before do
      create_premium_user
      user_sign_in
    end

    it "downgrades a premium user to a standard account" do
      visit user_path(@user)
      click_link 'Downgrade to Standard'
      expect(page).to have_content('Upgrade to Premium')
      #expect(@user.premium_at).to be_nil
    end
  end
end
