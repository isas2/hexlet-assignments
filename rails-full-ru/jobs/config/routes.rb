# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'home#index'

    resources :repositories, only: %i[index show new create update destroy] do
      collection do
        patch :update_repos
      end
    end
  end
end
