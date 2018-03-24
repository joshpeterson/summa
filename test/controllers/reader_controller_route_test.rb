# frozen_string_literal: true

require 'test_helper'

class ReaderControllerRouteTest < ActionController::TestCase
  def setup
    @controller = ReaderController.new
  end

  test 'routes browse to reader controller show action' do
    assert_recognizes({ controller: 'reader', action: 'show' },
                      '/read')
  end
end
