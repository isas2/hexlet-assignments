# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  # BEGIN
  # resources :posts, except: [:index] do
  #   scope module: 'posts' do
  #     resources :comments, except: %i[index new]
  #   end
  # end
  resources :posts, except: [:index] do
    scope module: 'posts' do
      resources :comments, only: %i[create]
    end
    scope :posts do
      scope module: 'posts', shallow: true do
        resources :comments, only: %i[edit destroy update show]
      end
    end
  end
  # END
end
