# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    user&.admin? || post.author_id == user&.id
  end

  def update?
    user&.admin? || post.author_id == user&.id
  end

  def destroy?
    user&.admin?
  end
end
