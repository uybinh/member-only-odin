require 'test_helper'

class LayoutLinksTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:uybinh)
  end

  test "vist home page" do
    get root_url
    assert_template "posts/index"
    assert_select "a.button", text: "Signup"
    assert_select "a.button", text: "Login"
  end
end

