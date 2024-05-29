# frozen_string_literal: true

10.times do
  Post.create(
    title: Faker::Lorem.sentence.chomp('.'),
    body: Faker::Lorem.paragraphs.join("\n\n"),
    summary: Faker::Lorem.sentence,
    published: Faker::Boolean.boolean(true_ratio: 0.85) # rubocop:disable Rails/ThreeStateBooleanColumn
  )
end
