FactoryGirl.define do
  factory :user do
    id 1
    username 'toby'
    email "toby@example.com"
    password '12345678'
    password_confirmation '12345678'
  end
end