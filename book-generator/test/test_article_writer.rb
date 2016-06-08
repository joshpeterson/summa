gem "minitest"
require "minitest/autorun"
require_relative "custom_assertions.rb"
require_relative "../generator/article_writer"
require_relative "../../summa-parser/models/article.rb"
require_relative "../../summa-parser/models/objection.rb"

class TestArticleWriter < MiniTest::Test
  def test_starts_with_title
    article = ArticleParsed.new("ARTICle title", "", "", Array.new)
    assert_startswith("# Article Title", ArticleWriter.write(article))
  end

  def test_article_content
    objections = [ObjectionParsed.new("Objection 1 text.", "First reply text."),
                  ObjectionParsed.new("Objection 2 text.", "Second reply text.")]
    article = ArticleParsed.new("ARTICle title", "Contrary text.", "Answer text.",
                                objections)
    assert_equal($expected_article_content, ArticleWriter.write(article))
  end

  def test_article_content_with_nil_reply
    objections = [ObjectionParsed.new("Objection 1 text.", nil),
                  ObjectionParsed.new("Objection 2 text.", "Second reply text.")]
    article = ArticleParsed.new("ARTICle title", "Contrary text.", "Answer text.",
                                objections)
    assert_equal($expected_article_content_with_nil_reply,
                 ArticleWriter.write(article))
  end

  def test_article_content_with_no_replies
    objections = [ObjectionParsed.new("Objection 1 text.", nil),
                  ObjectionParsed.new("Objection 2 text.", nil)]
    article = ArticleParsed.new("ARTICle title", "Contrary text.", "Answer text.",
                                objections)
    assert_equal($expected_article_content_with_no_replies,
                 ArticleWriter.write(article))
  end

  $expected_article_content = "# Article Title
## Objections
Objection 1: Objection 1 text.
Objection 2: Objection 2 text.
## Answer
On the contrary, Contrary text.
I answer that, Answer text.
## Replies
Reply 1: First reply text.
Reply 2: Second reply text."

  $expected_article_content_with_nil_reply = "# Article Title
## Objections
Objection 1: Objection 1 text.
Objection 2: Objection 2 text.
## Answer
On the contrary, Contrary text.
I answer that, Answer text.
## Replies
Reply 2: Second reply text."

  $expected_article_content_with_no_replies = "# Article Title
## Objections
Objection 1: Objection 1 text.
Objection 2: Objection 2 text.
## Answer
On the contrary, Contrary text.
I answer that, Answer text."

end
