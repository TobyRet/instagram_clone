FactoryGirl.define do
  factory :toby, class: 'User' do
    username 'toby'
    email 'toby@example.com'
    password '12345678'
    password_confirmation '12345678'
  end

  factory :rivka, class: 'User' do
    username 'rivka'
    email 'rivka@example.com'
    password '12345678'
    password_confirmation '12345678'
  end
end