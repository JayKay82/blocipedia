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
    click_button 'Create Wiki'
  end
end
