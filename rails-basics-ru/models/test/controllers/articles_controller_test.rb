require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_path
    assert_response :success
  end

  test "should get show" do
    article = Article.first
    get article_path(article.id)
    assert_response :success
  end
end
