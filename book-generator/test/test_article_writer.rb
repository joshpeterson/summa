# frozen_string_literal: true

gem 'minitest'
require 'minitest/autorun'
require_relative 'custom_assertions.rb'
require_relative '../generator/article_writer'
require_relative '../../summa-parser/models/article.rb'
require_relative '../../summa-parser/models/objection.rb'

class TestArticleWriter < MiniTest::Test
  def test_starts_with_title
    article = ArticleParsed.new('ARTICle title', '', '', [])
    assert_startswith('### Article Title', ArticleWriter.write(article))
  end

  def test_article_content
    objections = [ObjectionParsed.new('Objection 1 text.', 'First reply text.'),
                  ObjectionParsed.new('Objection 2 text.', 'Second reply text.')]
    article = ArticleParsed.new('ARTICle title', 'Contrary text.', 'Answer text.',
                                objections)
    assert_equal(EXPECTED_ARTICLE_CONTENT, ArticleWriter.write(article))
  end

  def test_article_content_with_nil_reply
    objections = [ObjectionParsed.new('Objection 1 text.', nil),
                  ObjectionParsed.new('Objection 2 text.', 'Second reply text.')]
    article = ArticleParsed.new('ARTICle title', 'Contrary text.', 'Answer text.',
                                objections)
    assert_equal(EXPECTED_ARTICLE_CONTENT_WITH_NIL_REPLY,
                 ArticleWriter.write(article))
  end

  def test_article_content_with_no_replies
    objections = [ObjectionParsed.new('Objection 1 text.', nil),
                  ObjectionParsed.new('Objection 2 text.', nil)]
    article = ArticleParsed.new('ARTICle title', 'Contrary text.', 'Answer text.',
                                objections)
    assert_equal(EXPECTED_ARTICLE_CONTENT_WITH_NO_REPLIES,
                 ArticleWriter.write(article))
  end
end

EXPECTED_ARTICLE_CONTENT = "### Article Title

**Objections**

Objection 1 text.

Objection 2 text.

**Answer**

Contrary text.

Answer text.

**Replies**

First reply text.

Second reply text."

EXPECTED_ARTICLE_CONTENT_WITH_NIL_REPLY = "### Article Title

**Objections**

Objection 1 text.

Objection 2 text.

**Answer**

Contrary text.

Answer text.

**Replies**

Second reply text."

EXPECTED_ARTICLE_CONTENT_WITH_NO_REPLIES = "### Article Title

**Objections**

Objection 1 text.

Objection 2 text.

**Answer**

Contrary text.

Answer text."
