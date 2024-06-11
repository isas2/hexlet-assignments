# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :set_post, only: %i[create]
  before_action :set_post_comment, only: %i[edit destroy show update]

  # GET /comments or /comments.json
  def index
    @post_comments = @post.post_comments
  end

  # GET /comments/1 or /comments/1.json
  def show; end

  # GET /comments/new
  def new
    @post_comment = @post.post_comments.build
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments or /comments.json
  def create
    @post_comment = @post.post_comments.build(post_comment_params)

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to post_path(@post), notice: 'Post comment was successfully created.' }
        format.json { render :show, status: :created, location: @post_comment }
      else
        format.html { redirect_to post_path(@post), status: :unprocessable_entity }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @post_comment.update(post_comment_params)
        format.html { redirect_to root_path, notice: 'Post comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @post_comment.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_post_comment
    @post_comment = PostComment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_comment_params
    params.require(:post_comment).permit(:body, :post_id)
  end
end
