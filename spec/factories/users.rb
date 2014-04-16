FactoryGirl.define do
  factory :user1, class: User do
    username 'user1'
    email 'user1@example.com'
    password '12345678'
    password_confirmation '12345678'
  end

  factory :user2, class: User do
    username 'user2'
    email 'user2@example.com'
    password '12345678'
    password_confirmation '12345678'
  end
end
