require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get show" do
    get(:show, :id => "1")
    assert_response(:success)
  end

  test "should return not found for show with out id" do
    get(:show)
    assert_response(:not_found)
  end

  test "should return first article" do
    get(:show, :id => "1")
    assert_equal("First article title", @controller.get_article.title)
  end

  test "should return second article" do
    get(:show, :id => "2")
    assert_equal("Second article title", @controller.get_article.title)
  end
end
