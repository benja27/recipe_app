require 'rails_helper'

RSpec.describe User do 
  include Devise::Test::ControllerHelpers
  let(:user) { FactoryBot.create(:user) }

  it 'try to go to root and is redirected to log in if user has not loggued in' do     
    visit root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it "check if user can sign in" do 
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(current_path).to eq(root_path)
  end

  it "check if user can sign out" do
    login_as(user, :scope => :user)
    visit root_path
    click_link 'Cerrar sesion'
    expect(current_path).to eq(root_path)
  end







end