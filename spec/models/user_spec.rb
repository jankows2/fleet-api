require 'spec_helper'

describe User do
  it 'should have and belong to many groups' do
    should have_and_belong_to_many(:groups)
  end

  it 'validates presence of email' do
    should validate_presence_of(:email)
  end

  it 'validates presence of first_name' do
    should validate_presence_of(:first_name)
  end

  it 'validates presence of last_name' do
    should validate_presence_of(:last_name)
  end

  it 'validates presence of password' do
    should validate_presence_of(:password)
  end

  it 'validates uniqueness of email' do
    should validate_uniqueness_of(:email)
  end

  it 'validates uniqueness of username' do
    should validate_uniqueness_of(:username)
  end

  it 'validates email format' do
    should allow_value('alan@fleetonrails.eu', 'alankehoe111@gmail.com').for(:email)
    should_not allow_value('gmail.com', 'alan', '@gmail.com').for(:email)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end
end
