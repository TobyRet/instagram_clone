FactoryGirl.define do
  factory :toby, class: 'User' do
    id 1
    username 'toby'
    email "toby@example.com"
    password '12345678'
    password_confirmation '12345678'
  end

  factory :rivka, class: 'User' do
    id 2
    username 'rivka'
    email "rivka@example.com"
    password '12345678'
    password_confirmation '12345678'
  end

  factory :user do
    id 3
    username 'bob'
    email "bob@example.com"
    password '12345678'
    password_confirmation '12345678'
  end
end