# frozen_string_literal: true

10.times do
  Task.create(
    name: Faker::Lorem.sentence.chomp('.'),
    description: Faker::Lorem.paragraphs.join("\n\n"),
    status: Faker::Subscription.status,
    creator: Faker::Name.unique.name,
    performer: Faker::Name.unique.name,
    completed: Faker::Boolean.boolean(true_ratio: 0.85) # rubocop:disable Rails/ThreeStateBooleanColumn
  )
end
