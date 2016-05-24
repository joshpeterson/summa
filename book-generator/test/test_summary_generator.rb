gem "minitest"
require "minitest/autorun"
require_relative "custom_assertions.rb"
require_relative "../generator/summary_generator"
require_relative "../../summa-parser/models/article"
require_relative "../../summa-parser/models/question"
require_relative "../../summa-parser/models/treatise"
require_relative "../../summa-parser/models/part"
require_relative "../../summa-parser/models/summa"

class TestSummaryGenerator < Minitest::Test
  def setup
    @generator = SummaryGenerator.new()
  end

  def test_FirstLineIsSummaryTag
    summary = @generator.Write(SummaParsed.new(Array.new))
    assert_startswith("# Summary", summary)
  end

  def test_EmitEntryWithNoIndent
    entry = @generator.EmitEntry(0, "Text", "Link")
    assert_equal("* [Text](Link)", entry)
  end

  def test_EmitEntryWithIndent
    entry = @generator.EmitEntry(4, "Text", "Link")
    assert_equal("    * [Text](Link)", entry)
  end

  def test_AppendPrologueLink
    path = Array.new
    path.push("First Part")
    link = @generator.AppendPrologueLink(path)
    assert_equal("first_part/prologue.md", link)
  end

  def test_EmitArticleMarkdownFilename
    filename = @generator.EmitArticleMarkdownFilename("Whether God is one?")
    assert_equal("whether_god_is_one.md", filename)
  end

  def test_PathFromStack
    stack = Array.new
    stack.push("First Part")
    stack.push("Treatise on the one God")
    path = @generator.PathFromStack(stack)
    assert_equal("first_part/treatise_on_the_one_god", path)
  end

  def test_WriteReturnsFullSummary
    articles = Array.new(8)
    for i in 0..articles.length - 1
      articles[i] = ArticleParsed.new("Article #{i+1}", nil, nil, nil)
    end

    questions = Array.new(4)
    questions[0] = QuestionParsed.new("Question 1", nil, articles[0..1])
    questions[1] = QuestionParsed.new("Question 2", nil, articles[2..3])
    questions[2] = QuestionParsed.new("Question 3", nil, articles[4..5])
    questions[3] = QuestionParsed.new("Question 4", nil, articles[6..7])

    treatises = Array.new(4)
    treatises[0] = TreatiseParsed.new("Treatise 1", nil, questions[0,1])
    treatises[1] = TreatiseParsed.new("Treatise 2", nil, questions[1,1])
    treatises[2] = TreatiseParsed.new("Treatise 3", nil, questions[2,1])
    treatises[3] = TreatiseParsed.new("Treatise 4", nil, questions[3,1])

    parts = Array.new(2)
    parts[0] = PartParsed.new("Part 1", nil, treatises[0..1])
    parts[1] = PartParsed.new("Part 2", nil, treatises[2..3])

    summa = SummaParsed.new(parts)
    summary = @generator.Write(summa)
    assert_equal($expected_summary, summary)
  end

$expected_summary= %{# Summary
* [Part 1](part_1/prologue.md)
  * [Treatise 1](part_1/treatise_1/prologue.md)
    * [Question 1](part_1/treatise_1/question_1/prologue.md)
      * [Article 1](part_1/treatise_1/question_1/article_1.md)
      * [Article 2](part_1/treatise_1/question_1/article_2.md)
  * [Treatise 2](part_1/treatise_2/prologue.md)
    * [Question 2](part_1/treatise_2/question_2/prologue.md)
      * [Article 3](part_1/treatise_2/question_2/article_3.md)
      * [Article 4](part_1/treatise_2/question_2/article_4.md)
* [Part 2](part_2/prologue.md)
  * [Treatise 3](part_2/treatise_3/prologue.md)
    * [Question 3](part_2/treatise_3/question_3/prologue.md)
      * [Article 5](part_2/treatise_3/question_3/article_5.md)
      * [Article 6](part_2/treatise_3/question_3/article_6.md)
  * [Treatise 4](part_2/treatise_4/prologue.md)
    * [Question 4](part_2/treatise_4/question_4/prologue.md)
      * [Article 7](part_2/treatise_4/question_4/article_7.md)
      * [Article 8](part_2/treatise_4/question_4/article_8.md)
}
end
