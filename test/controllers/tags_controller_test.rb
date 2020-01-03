require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
   # Test to verify that a tags#index can be reached 
   test "should get tags index" do
    get tags_path
    assert_response :success
  end
end
