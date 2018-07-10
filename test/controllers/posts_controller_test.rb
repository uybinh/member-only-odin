require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:uybinh)
  end

  test "should get new" do
    log_in_as(@user)
    get new_post_path
    assert_response :success
  end

  test "should get index" do
    get posts_path
    assert_response :success
  end

end
