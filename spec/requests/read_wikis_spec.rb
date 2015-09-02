require 'rails_helper'

RSpec.describe 'Read Wikis', type: :request do
  include WikiSteps

  feature %(As a user
            I want to
            read wikis) do
    before do
      create_standard_user
      user_sign_in
      click_link 'New Wiki'
      complete_wiki_form
    end

    it "reads a wiki" do
      click_link 'Example Title'
      expect(page).to have_content('This is an example body for my example wiki that is supposed to be quite long, bla bla bla.')
    end

    describe 'a private wiki' do
      before do
        user = create(:user, email: 'other@example.com')
        create(:wiki, private: true, title: 'Private Wiki', user: user)
      end

      it 'is not visible in the list' do
        visit '/wikis'
        expect(page).not_to have_content('Private Wiki')
      end

      describe 'GET /wikis/:id' do
        it 'is not visible' do
          visit wiki_path(Wiki.first)
          # expect(page.status_code).to be(404)
          expect(page).to have_content('Update to Premium in order to view private wikis.')
        end
      end
    end
  end
end
