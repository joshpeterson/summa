# frozen_string_literal: true

require 'test_helper'

class QuestionsControllerViewTest < ActionController::TestCase
  def setup
    @controller = QuestionsController.new
  end

  def get_question(number)
    get(:show, id: number)
    @lists = css_select('div.list')
    @items = css_select(@lists[0], 'a.item')
  end

  test 'view has the proper title' do
    get_question('1')
    assert_select('title', 'First question - Summa Explorer')
  end

  test 'view has proper header' do
    get_question('1')
    assert_select('div.title', 'First question')
  end

  test 'view has proper content' do
    get_question('1')
    assert_select('div.content', 'Content for first question.')
  end

  test 'view for first question has proper number of articles' do
    get_question('1')
    assert_equal(1, @lists.count, 'Wrong number of lists found.')
    assert_equal(2, @items.count, 'Wrong number of items found.')
  end

  test 'view for second question has proper number of articles' do
    get_question('2')
    assert_equal(1, @lists.count, 'Wrong number of lists found.')
    assert_equal(2, @items.count, 'Wrong number of items found.')
  end

  test 'view for first question has proper first article' do
    get_question('1')
    a = css_select(@items[0], 'a').first
    assert_match('First article title', a.inner_html)
  end

  test 'view for first question has proper second article' do
    get_question('1')
    a = css_select(@items[1], 'a').first
    assert_match('Second article title', a.inner_html)
  end

  test 'view for second question has proper first article' do
    get_question('2')
    a = css_select(@items[0], 'a').first
    assert_match('Third article title', a.inner_html)
  end

  test 'view for second question has proper second article' do
    get_question('2')
    a = css_select(@items[1], 'a').first
    assert_match('Fourth article title', a.inner_html)
  end

  test 'view for first question has proper link to first article' do
    get_question('1')
    assert_select('a[href=?]', '/articles/1')
  end

  test 'view for first question has proper link to second article' do
    get_question('1')
    assert_select('a[href=?]', '/articles/2')
  end

  test 'view for second question has proper link to first article' do
    get_question('2')
    assert_select('a[href=?]', '/articles/3')
  end

  test 'view for second question has proper link to second article' do
    get_question('2')
    assert_select('a[href=?]', '/articles/4')
  end

  test 'articles are sorted by article number' do
    get_question('4')
    a = css_select(@items[0], 'a').first
    assert_match('Fifth article title', a.inner_html)
  end
end
