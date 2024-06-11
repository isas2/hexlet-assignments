# frozen_string_literal: true

json.extract! post_comment, :id, :body, :post_id, :created_at, :updated_at
json.url comment_url(post_comment, format: :json)
