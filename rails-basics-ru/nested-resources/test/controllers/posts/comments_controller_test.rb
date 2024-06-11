require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_comment = post_comments(:one)
  end

  test "should create post_comment" do
    assert_difference("PostComment.count") do
      post post_comments_url(@post_comment.post_id), params: { post_comment: { body: @post_comment.body, post_id: @post_comment.post_id } }
    end

    assert_redirected_to post_url(@post_comment.post_id)
  end

  test "should get edit" do
    get edit_comment_url(@post_comment)
    assert_response :success
  end

  test "should update post_comment" do
    patch comment_url(@post_comment), params: { post_comment: { body: @post_comment.body, post_id: @post_comment.post_id } }
    assert_redirected_to root_url
  end

  test "should destroy post_comment" do
    assert_difference("PostComment.count", -1) do
      delete comment_url(@post_comment)
    end

    assert_redirected_to root_url
  end
end
