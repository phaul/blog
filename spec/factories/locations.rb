FactoryGirl.define do
  factory :location do
    latitude 1.5
    longitude 1.5
    label "MyString"
    association :locationable, factory: :blogpost
  end
end
