# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  it { should allow_value('email@address.com').for(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }

  it 'has a valid factory' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'is valid with an email and password' do
    user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(email: nil, password: 'password123', password_confirmation: 'password123')
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user = User.new(email: 'test@example.com', password: nil)
    expect(user).to_not be_valid
  end

  describe 'database authenticatable' do
    it 'encrypts the password' do
      user = User.create(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      expect(user.encrypted_password).to_not be_blank
      expect(user.valid_password?('password123')).to be true
    end
  end
end
