require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  # Test to verify that a article#index can be reached 
  test "should get articles index" do
    get articles_path
    assert_response :success
  end

  # Test to verify that a article#new can be reached 
  test "should get new article" do
    get new_article_path
    assert_response :success
  end

  # Test to verify that a article#show can be reached 
  test "should show article" do
    # article is from the articles fixture file
    article = articles(:two)
    get article_path(article)
    assert_response :success
  end

end