# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_group do
    user_id 1
    group_id 1
    group_access 20
  end
end
