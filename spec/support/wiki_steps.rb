# WikiSteps provides methods for my Wiki tests
module WikiSteps
  def create_standard_user(email='user@example.com')
    @user = build(:user, email: email)
    @user.skip_confirmation!
    @user.save
  end

  def create_premium_user(email='premium_user@example.com')
    create_standard_user(email)
    upgrade_user_to_premium
  end

  def user_sign_in
    visit '/users/sign_in'
    fill_in :user_email, with: @user.email
    fill_in :user_password, with: 'password'
    click_button 'Log in'
  end

  def upgrade_user_to_premium
    @user.touch(:premium_at)
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

  def complete_private_wiki_form
    fill_in :wiki_title, with: 'Example Private Title'
    fill_in :wiki_body, with: 'This is an example private body which is also quite long, bla bla bla.'
    check 'Make wiki private'
    click_button 'Save Wiki'
  end
end
