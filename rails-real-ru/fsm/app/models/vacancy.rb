# frozen_string_literal: true

class Vacancy < ApplicationRecord
  include AASM

  validates :title, presence: true
  validates :description, presence: true

  aasm column: 'aasm_state' do
    state :on_moderate, initial: true
    state :published
    state :archived

    event :publish do
      transitions from: :on_moderate, to: %i[published archived]
    end

    event :archive do
      transitions from: %i[on_moderate published], to: :archived
    end
  end
end
