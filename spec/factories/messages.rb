FactoryGirl.define do
  factory :message do
    body 'Hello World!'
    association :user, factory: :user
    association :room, factory: :room
  end
end
