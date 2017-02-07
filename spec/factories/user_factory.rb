FactoryGirl.define do
  factory :user do
    password "987654321"
    admin false

    trait :first do
      email "peter@example.com"
      first_name "Peter"
      last_name "Example"
    end
    trait :second do
      email "bob@example.com"
      first_name "Bob"
      last_name "Top"
    end
  end
end