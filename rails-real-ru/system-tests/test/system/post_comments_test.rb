# frozen_string_literal: true

require "application_system_test_case"

class PostCommentsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
    @post_comment = post_comments(:one)
  end

  test 'should create post_comment' do
    visit post_url(@post)

    fill_in 'post_comment[body]', with: @post_comment.body
    click_on 'Create Comment'

    assert_text 'Comment was successfully created.'
    click_on 'Back'
  end

  test 'should update post_comment' do
    visit post_url(@post)
    href = "/posts/#{@post.id}/comments/#{@post_comment.id}/edit"
    find('div.card').find_link(href:).click

    fill_in 'Body', with: @post.body
    click_on 'Update Comment'

    assert_text 'Comment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy post_comment' do
    visit post_url(@post)
    href = "/posts/#{@post.id}/comments/#{@post_comment.id}"
    page.accept_confirm do
      find('div.card').find_link(class: 'link-danger', href:).click
    end

    assert_text 'en.posts.comments.destroy.success'
  end
end
