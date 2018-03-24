# frozen_string_literal: true

require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test 'should get show' do
    get(:show, id: '1')
    assert_response(:success)
  end

  test 'should return not found for show with out id' do
    get(:show)
    assert_response(:not_found)
  end

  test 'should return first question' do
    get(:show, id: '1')
    assert_equal('First question', @controller.question.title)
  end

  test 'should return second question' do
    get(:show, id: '2')
    assert_equal('Second question', @controller.question.title)
  end

  test 'should set a cookie with the url of the current question' do
    get(:show, id: '2')
    assert_equal('/questions/2', @response.cookies['reader'])
  end
end
