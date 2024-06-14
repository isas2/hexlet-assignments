# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/(:locale)', locale: /en|ru/ do
    root 'home#index'
    resources :posts do
      scope module: 'posts' do
        resources :comments, only: %i[create edit destroy update show]
      end
      # scope module: 'posts' do
      #   resources :comments, only: %i[create]
      # end
      # scope :posts do
      #   scope module: 'posts', shallow: true do
      #     resources :comments, only: %i[edit destroy update show]
      #   end
      # end
    end
  end
end
