# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, :status, :creator, presence: true
  validates :name, :status, :creator, format: { with: /\A[a-zA-Z ]+\z/,
                                                message: 'only allows letters' }
  validates :completed, inclusion: [true, false]
  attribute :status, :string, default: 'new'
end
