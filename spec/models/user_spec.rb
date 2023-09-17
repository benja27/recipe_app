require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryBot.create(:user) }

  it 'valdate the presense of name' do
    expect(user).to be_valid
  end

  it 'valdate the presense of email' do
    expect(user).to be_valid
  end

  it 'fails validation with no name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'fails validation with no email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'fails when email is not unique' do
    user2 = FactoryBot.build(:user, email: user.email)
    expect(user2).to_not be_valid
  end

  it 'fails when email is does not have @ symbol' do
    user.email = 'test'
    expect(user).to_not be_valid
  end


  it 'fails when password is less than 2 characters' do
    user.password = 't'
    expect(user).to_not be_valid
  end
end

  it 'name should be present' do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password')
    expect(user).to be_valid

    user.name = nil
    expect(user).to_not be_valid
  end
end

