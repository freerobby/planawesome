FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "First#{n} Last#{n}"
    end
    sequence :uid do |n|
      n.to_s
    end
    provider "twitter"
  end
end