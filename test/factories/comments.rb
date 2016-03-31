FactoryGirl.define do
  factory :comment, class: Comment do
    association :user, factory: :user
    association :commentable, factory: :topic
    sequence(:body) { |n| "body#{n}" }
  end
end
