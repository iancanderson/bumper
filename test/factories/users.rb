FactoryBot.define do
  factory :user do
    email { "MyString" }

    trait :admin do
      admin { true }
    end
  end
end
