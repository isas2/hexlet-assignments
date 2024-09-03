# frozen_string_literal: true

class Article < ApplicationRecord
  def last_reading_date
    Rails.cache.fetch("#{cache_key_with_version}/last_reading_date", expires_in: 12.hours) do
      Date.today
    end
  end
end
