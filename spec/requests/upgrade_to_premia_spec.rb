require 'rails_helper'

RSpec.describe "Upgrade To Premium Account", type: :request do
  include WikiSteps

  feature %(In order to create private wikis
            as a user I want to
            upgrade to a premium subscription) do
    before do
      create_standard_user
      user_sign_in
    end

    it 'upgrades a user to a premium account' do
      upgrade_user_to_premium
      expect(@user.premium_at).not_to be_nil
    end

    describe 'private wiki' do
      before do
        upgrade_user_to_premium
        private_wiki = create(:wiki, title: 'My Private Wiki Title', private: true, user: @user)
      end

      it 'lets a premium user see his/her own private wikis' do
        visit wikis_path
        expect(page).to have_content('My Private Wiki Title')
      end

      describe 'other standard users' do
        before do
          click_link 'Sign Out'
          create_standard_user('other_user@example.com')
          user_sign_in
        end

        it 'does not let other users see your private wikis' do
          expect(page).not_to have_content('My Private Wiki Title')
        end
      end

      describe 'other premium users' do
        before do
          click_link 'Sign Out'
          create_premium_user('other_premium_user@example.com')
          user_sign_in
        end

        it 'does not let other premium users see your private wikis' do
          expect(page).not_to have_content('My Private Wiki Title')
        end
      end
    end
  end
end
