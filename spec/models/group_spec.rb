require 'spec_helper'

describe Group do
  it 'should have many cars' do
    should have_many(:cars)
  end

  it 'should have many destinations' do
    should have_many(:destinations)
  end

  it 'should have many vendors' do
    should have_many(:vendors)
  end

  it 'should have many user groups' do
    should have_many(:user_groups)
  end

  it 'should have many users through user groups' do
    should have_many(:users).through(:user_groups)
  end

  it 'should validate presence of name' do
    should validate_presence_of(:name)
  end

  it 'should uniqueness of name' do
    should validate_uniqueness_of(:name)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:group)).to be_valid
  end
end
