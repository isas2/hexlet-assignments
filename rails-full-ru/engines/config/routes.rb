# frozen_string_literal: true

Rails.application.routes.draw do
  mount Blog::Engine, at: "/blog"
  mount RailsStats::Engine, at: "/stats"

  scope module: :web do
    root 'home#index'
  end
end
