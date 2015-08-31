require 'rails_helper'

RSpec.describe 'Read Wikis', type: :request do
  include WikiSteps

  feature %(As a user
            I want to
            be able to read public wikis) do
    before do
      user_sign_in
      click_link 'New Wiki'
      complete_wiki_form
    end

    it "reads a wiki" do
      click_link 'Example Title'
      expect(page).to have_content('This is an example body for my example wiki that is supposed to be quite long, bla bla bla.')
    end
  end
end
