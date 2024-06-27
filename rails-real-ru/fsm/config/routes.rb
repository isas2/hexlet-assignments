# frozen_string_literal: true

Rails.application.routes.draw do
  resources :vacancies, only: %i[index new create] do
    member do
      patch :archive
      patch :publish
    end
  end

  root 'vacancies#index'
end
