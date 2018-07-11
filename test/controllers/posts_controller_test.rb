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

  test "can't post withou login" do
    get new_post_path
    assert_redirected_to root_path
    follow_redirect!
    assert_template "posts/index"
  end


  test "should get index" do
    get posts_path
    assert_response :success
  end

end
