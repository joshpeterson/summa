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

  test "should provide a question context string" do
    get(:show, :id => "1")
    assert_equal("Article 11 of 42", @controller.context_in_question)
  end

  test "should provide a treatise context string" do
    get(:show, :id => "1")
    assert_equal("Article 12 of 42", @controller.context_in_treatise)
  end

  test "should provide a part context string" do
    get(:show, :id => "1")
    assert_equal("Article 13 of 42", @controller.context_in_part)
  end

  test "should provide a question context percent" do
    get(:show, :id => "1")
    assert_equal(26, @controller.percent_in_question)
  end

  test "should provide a treatise percent string" do
    get(:show, :id => "1")
    assert_equal(29, @controller.percent_in_treatise)
  end

  test "should provide a part percent string" do
    get(:show, :id => "1")
    assert_equal(31, @controller.percent_in_part)
  end
end
