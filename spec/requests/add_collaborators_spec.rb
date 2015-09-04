require 'rails_helper'

RSpec.describe 'Add Collaborators', type: :request do
  include WikiSteps

  feature %(In order to collaborate on wikis,
            as a premium user I want to
            add collaborators to my wikis) do
    before do
      create_premium_user
      user_sign_in
      @wiki = create(:wiki, private: true, user: @user)
    end

    it 'adds a collaborator' do
      visit edit_wiki_path(@wiki)
      select('user@example.com', from: 'wiki[collaboration_user_ids][]')
      click_button 'Add'
      expect(page).to have_content('Wiki successfully updated')
      expect(page).to have_content('UserName')
    end
  end
end
