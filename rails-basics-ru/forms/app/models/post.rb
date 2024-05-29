# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :body, :summary, presence: true
  validates :title, format: { with: /\A[a-zA-Z ]+\z/,
                              message: 'only allows letters' }
  validates :published, inclusion: [true, false]
end
