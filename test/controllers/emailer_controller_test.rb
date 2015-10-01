require 'test_helper'

class EmailerControllerTest < ActionController::TestCase
  test "should get problem_email" do
    get :problem_email
    assert_response :success
  end

end
