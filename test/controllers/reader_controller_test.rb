require 'test_helper'

class ReaderControllerTest < ActionController::TestCase
  test 'should get show' do
    get :show
    assert_response :success
  end

  test 'show should redirect to the article with the stored cookie' do
    @request.cookies['reader'] = '/articles/2'
    get(:show)
    assert_redirected_to(controller: 'articles', action: 'show', id: '2')
  end
end
