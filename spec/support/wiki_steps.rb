# WikiSteps provides methods for my Wiki tests
module WikiSteps
  def user_sign_in
    @user = build(:user)
    @user.skip_confirmation!
    @user.save
    visit '/users/sign_in'
    fill_in :user_email, with: 'user@example.com'
    fill_in :user_password, with: 'password'
    click_button 'Log in'
  end

  def complete_wiki_form
    fill_in :wiki_title, with: 'Example Title'
    fill_in :wiki_body, with: 'This is an example body for my example wiki that is supposed to be quite long, bla bla bla.'
    click_button 'Save Wiki'
  end

  def complete_wiki_update_form
    fill_in :wiki_title, with: 'Updated Example Title'
    click_button 'Save Wiki'
  end
end
