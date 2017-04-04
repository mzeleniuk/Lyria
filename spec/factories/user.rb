FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user_#{n}" }
    sequence(:email) { |n| "user_#{n}@mail.com" }
    show_email true
    about_me 'Test'
    password 'secret'
    password_confirmation 'secret'

    trait :confirmed do
      confirmed_at Date.today
    end
  end
end
