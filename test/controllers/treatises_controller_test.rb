require 'test_helper'

class TreatisesControllerTest < ActionController::TestCase
  test "should get show" do
    get(:show, :id => "1")
    assert_response(:success)
  end

  test "should return not found for show with out id" do
    get(:show)
    assert_response(:not_found)
  end

  test "should return first treatise" do
    get(:show, :id => "1")
    assert_equal("First treatise", @controller.get_treatise.title)
  end

  test "should return second treatise" do
    get(:show, :id => "2")
    assert_equal("Second treatise", @controller.get_treatise.title)
  end

  test "should set a cookie with the url of the current treatise" do
    get(:show, :id => "2")
    assert_equal("/treatises/2", @response.cookies["reader"])
  end
end
