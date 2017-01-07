require 'test_helper'

class QuestionsControllerRouteTest < ActionController::TestCase
  def setup
    @controller = QuestionsController.new
  end

  test 'routes the question id to the show action' do
    assert_recognizes({ controller: 'questions', action: 'show', id: '1' },
                      '/questions/1')
  end
end
