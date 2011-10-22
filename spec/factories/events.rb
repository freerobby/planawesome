FactoryGirl.define do
  factory :event do
    sequence :name do |n|
      "Event#{n}"
    end
    sequence :location do |n|
      "Location#{n}"
    end
    starts_at Time.now
    min_attendance 5
    max_attendance 10
    user
  end
end