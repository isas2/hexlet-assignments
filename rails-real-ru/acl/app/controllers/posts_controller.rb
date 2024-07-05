# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  after_action :verify_authorized, except: %i[index show]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    authorize Post
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    authorize Post
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post&.destroy!

    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
  def set_post
    @post = Post.find params[:id]
    authorize @post
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :aasm_state)
  end
end
