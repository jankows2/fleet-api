require 'spec_helper'

describe Car do
  it 'should belong to owner' do
    should belong_to(:owner)
  end

  it 'should have many diagnostic statistics' do
    should have_many(:diagnostic_statistics)
  end

  it 'should have many diagnostic faults' do
    should have_many(:diagnostic_faults)
  end

  it 'should have many gps statistics' do
    should have_many(:service_records)
  end

  it 'should have many service records' do
    should have_many(:service_records)
  end

  it 'should have many documents' do
    should have_many(:documents)
  end

  it 'should validate presence of make' do
    should validate_presence_of(:make)
  end

  it 'should validate presence of model' do
    should validate_presence_of(:model)
  end

  it 'should validate presence of registration' do
    should validate_presence_of(:registration)
  end

  it 'should validate uniqueness of registration' do
    should validate_uniqueness_of(:registration)
  end
end
