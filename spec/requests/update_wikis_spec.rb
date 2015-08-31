require 'rails_helper'

RSpec.describe "Update Wikis", type: :request do
  include WikiSteps

  feature %(As a user
             I want to
             upadate a wiki) do
    before do
      user_sign_in
      click_link 'New Wiki'
      complete_wiki_form
    end

    it 'updates a wiki' do
      click_link 'Example Title'
      click_link 'Edit Wiki'
      complete_wiki_update_form
      expect(page).to have_content('Updated Example Title')
    end
  end
end
