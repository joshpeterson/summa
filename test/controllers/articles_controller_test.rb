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

  test "should provide the next article" do
    get(:show, :id => "1")
    assert_equal(2, @controller.get_next.id)
  end

  test "should provide a nil next article for the last article" do
    get(:show, :id => "4")
    assert_nil(@controller.get_next)
  end

  test "should provide previous next article" do
    get(:show, :id => "4")
    assert_equal(3, @controller.get_previous.id)
  end

  test "should provide a nil previous article for the first article" do
    get(:show, :id => "1")
    assert_nil(@controller.get_previous)
  end

  test "process_html should replace an empty line with two br tags" do
    assert_equal("First\n<br><br>Second", @controller.process_html("First\n\nSecond"))
  end

  test "should set a cookie with the url of the current article" do
    get(:show, :id => "2")
    assert_equal("/articles/2", @response.cookies["reader"])
  end
end
