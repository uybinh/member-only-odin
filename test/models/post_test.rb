require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: "Hello world", body: "Helo body body body body body")
    @post.user = users(:uybinh)
  end
  
  test "should be valid" do
    assert @post.valid?
  end

  test "should not accept invalid infomation" do
    @post.title = "hello"
    assert_not @post.valid?
    @post.title = "hello" * 3
    assert @post.valid?
    @post.body = "hello"
    assert_not @post.valid?
  end

  test "should not accept blank" do
    @post.title = " " * 11
    assert_not @post.valid?
    @post.title = "hello" * 3
    assert @post.valid?
    @post.body = " " * 21
    assert_not @post.valid?
  end

end
