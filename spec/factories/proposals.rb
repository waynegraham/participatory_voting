FactoryBot.define do
  factory :proposal do
    author { Faker::Book.author }
    abstract { Faker::Lorem.paragraph(1, true) }
    title { Faker::Book.title }
  end
end
