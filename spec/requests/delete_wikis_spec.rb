require 'rails_helper'

RSpec.describe "Delete Wikis", type: :request do
  include WikiSteps

  feature %(As a user
            I want to
            delete wikis) do
    before do
      user_sign_in
      click_link 'New Wiki'
      complete_wiki_form
    end

    it "deletes a wiki" do
      click_link 'Example Title'
      click_link 'Delete'
      expect(page).to have_content('Successfully deleted wiki.')
    end
  end
end
