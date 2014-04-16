FactoryGirl.define do
  factory :post1, class: Post do
    description 'Testing a kitten'
    tag_names '#kitten #cute'
    association :user, factory: :user1
  end
  factory :post2, class: Post do
    description 'Testing a kitten'
    association :user, factory: :user2
  end
end
