# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'visiting the index' do
    visit posts_url
    assert_selector 'h1', text: 'Posts'
  end

  test 'should create post' do
    visit posts_url
    click_on 'New Post'

    fill_in 'Body', with: @post.body
    fill_in 'Title', with: @post.title
    click_on 'Create Post'

    assert_text 'Post was successfully created'
    click_on 'Back'
  end

  test 'should update Post' do
    visit post_url(@post)
    find('div.d-flex a.btn', text: 'Edit').click

    fill_in 'Body', with: @post.body
    fill_in 'Title', with: @post.title
    click_on 'Update Post'

    assert_text 'Post was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Post' do
    visit posts_url
    page.accept_confirm do
      find_link(class: 'link-danger', href: "/posts/#{@post.id}").click
    end

    assert_text 'Post was successfully destroyed'
  end
end