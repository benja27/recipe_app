require 'rails_helper'

RSpec.describe Recipe do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
    puts 'User logged in'
  end
end
