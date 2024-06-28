# frozen_string_literal: true

class Resume < ApplicationRecord
  validates :name, presence: true
  validates :contact, presence: true

  has_many :educations, dependent: :delete_all, class_name: 'ResumeEducation'
  has_many :works, dependent: :delete_all, class_name: 'ResumeWork'
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :works, reject_if: :all_blank, allow_destroy: true
end
