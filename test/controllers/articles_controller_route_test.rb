require 'test_helper'

class ArticlesControllerRouteTest < ActionController::TestCase
  def setup
    @controller = ArticlesController.new
  end

  test 'routes the article id to the show action' do
    assert_recognizes({ controller: 'articles', action: 'show', id: '1' },
                      '/articles/1')
  end
end
