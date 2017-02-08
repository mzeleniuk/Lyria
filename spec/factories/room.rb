FactoryGirl.define do
  factory :room do
    title 'Rails 5'
    description 'All about Rails 5'
    association :user, factory: :user
  end
end
