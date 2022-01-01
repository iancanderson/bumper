FactoryBot.define do
  factory :song do
    recording { nil }
    artist { "MyString" }
    sequence(:title) { |n| "Song #{n}" }
    sequence(:queue_position) { |n| n }
  end
end
