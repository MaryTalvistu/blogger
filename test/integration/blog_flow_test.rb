require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest

  # Test to verify that root path is articles#index
  test "can see the posts page" do
    get "/"
    assert_select "h1", "All Posts"
  end

  # Test to verify that post can be created successfully 
  test "can create a post" do
    get "/articles/new"
    assert_response :success
    post "/articles",
      article: { title: "Title", body: "Body", tag_list: "first, second" }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Title"
    assert_select "h2", "Body"
  end

  # Test to verify that a comment can be posted successfully 
  test "can post a comment" do
    # article is from the articles fixture file
    article = articles(:one)
    assert_difference('article.comments.count') do
      post article_comments_path(article),
        {article_id: article.id, comment: { author_name: "Name", body: "Body" } }
    end
    assert_redirected_to article_path(article)
  end

end