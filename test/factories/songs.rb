FactoryBot.define do
  factory :song do
    recording { nil }
    artist { "MyString" }
    sequence(:title) { |n| "Song #{n}" }
  end
end
