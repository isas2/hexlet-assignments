# frozen_string_literal: true

class Repository < ApplicationRecord
  include AASM

  validates :link, presence: true, uniqueness: true

  aasm do
    state :created, initial: true
    state :fetching
    state :fetched
    state :failed

    event :fetch do
      after { RepositoryLoaderJob.perform_later(self) }
      transitions from: %i[created fetched failed], to: :fetching
    end

    event :modify do
      transitions from: :fetching, to: :fetched
    end

    event :fail do
      transitions from: :fetching, to: :failed
    end
  end
end
