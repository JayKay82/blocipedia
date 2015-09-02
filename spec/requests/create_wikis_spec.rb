require 'rails_helper'

RSpec.describe 'Create Wikis', type: :request do
  include WikiSteps

  feature %(In order to record my thoughts
             As a user
             I want to create a wiki) do
    before do
      create_standard_user
      user_sign_in
    end

    it 'creates a wiki' do
      click_link 'New Wiki'
      complete_wiki_form
      expect(page).to have_content('Example Title')
    end

    it 'should not allow a standard user to create a private wiki' do
      click_link 'New Wiki'
      expect(page).not_to have_content('Make wiki private')
    end

    describe 'private wikis' do
      before do
        upgrade_user_to_premium
      end

      it 'allows a premium user to make a wiki private' do
        visit wikis_path
        click_link 'New Wiki'
        expect(page).to have_content('Make wiki private')
      end

      it 'creates a premium wiki' do
        visit wikis_path
        click_link 'New Wiki'
        complete_private_wiki_form
        expect(page).to have_content('Example Private Title')
      end
    end
  end
end
