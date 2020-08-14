# frozen_string_literal: true

FactoryBot.define do
  factory :proposal do
    id { 1 }
    title { Faker::Book.title }
    author { Faker::Book.author }
    abstract { Faker::Lorem.paragraph(sentence_count: 5) }
    contribution_type { 'Fake ContributionType' }
    contribution_format { 'Fake ContributionFormat' }
  end
end
