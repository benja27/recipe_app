require 'rails_helper'

RSpec.describe User do
  # include Devise::Test::ControllerHelpers
  let(:user) { FactoryBot.create(:user) }

  before do
  end

  it 'try to go to root and is redirected to log in if user has not loggued in' do
    visit root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'check if user can sign in' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(current_path).to eq(root_path)
  end

  it 'check if user can sign out' do
    @user = FactoryBot.create(:user) # Asegúrate de crear un usuario válido con FactoryBot
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    within('form') do
      click_button 'Cerrar sesión'
    end

    # expect(current_path).to eq(root_path)
    expect(current_path).to eq(new_user_session_path)
  end

  it 'check if user can sign up' do
    visit new_user_registration_path
    fill_in 'user_name', with: 'Ricardo'
    fill_in 'user_email', with: 'rksnek@gmail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    expect(current_path).to eq('/')
  end
end
