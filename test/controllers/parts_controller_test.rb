require 'test_helper'

class PartsControllerTest < ActionController::TestCase
  test "should get show" do
    get(:show, :id => "1")
    assert_response(:success)
  end

  test "should return not found for show with out id" do
    get(:show)
    assert_response(:not_found)
  end

  test "should return first part" do
    get(:show, :id => "1")
    assert_equal("FIRST PART", @controller.get_part.title)
  end

  test "should return second part" do
    get(:show, :id => "2")
    assert_equal("SECOND PART", @controller.get_part.title)
  end
end