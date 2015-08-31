require 'rails_helper'

RSpec.describe 'Create Wikis', type: :request do
  include WikiSteps

  feature %(In order to record my thoughts
             As a user
             I want to create a wiki) do
    before do
      user_sign_in
    end

    it 'creates a wiki' do
      click_link 'New Wiki'
      complete_wiki_form
      expect(page).to have_content('Example Title')
    end
  end
end
