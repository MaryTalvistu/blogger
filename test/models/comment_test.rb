require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without params" do
    comment = Comment.new()
    assert_not comment.save
  end

  test "should not save comment without body" do
    comment = Comment.new(author_name: "Author")
    assert_not comment.save
  end

  test "should not save comment without a comment name" do
    comment = Comment.new(body: "Body")
    assert_not comment.save
  end
end
