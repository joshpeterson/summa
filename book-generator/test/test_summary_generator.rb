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
    summary = @generator.write(SummaParsed.new(Array.new))
    assert_startswith("# Summary", summary)
  end

  def test_EmitEntryWithNoIndent
    entry = @generator.emit_entry(0, "Text", "Link")
    assert_equal("* [Text](Link)", entry)
  end

  def test_EmitEntryWithIndent
    entry = @generator.emit_entry(4, "Text", "Link")
    assert_equal("    * [Text](Link)", entry)
  end

  def test_WriteReturnsFullSummary
    articles = Array.new(8)
    for i in 0..articles.length - 1
      articles[i] = ArticleParsed.new("Article #{i+1}", nil, nil, nil)
    end

    questions = Array.new(4)
    questions[0] = QuestionParsed.new("Question 1", nil, articles[0..1])
    questions[1] = QuestionParsed.new("Question 2", nil, articles[2..3])
    questions[2] = QuestionParsed.new("QuestioN 3 (FOUR)", nil, articles[4..5])
    questions[3] = QuestionParsed.new("Question 4", nil, articles[6..7])

    treatises = Array.new(4)
    treatises[0] = TreatiseParsed.new("Treatise 1", nil, questions[0,1])
    treatises[1] = TreatiseParsed.new("TrEatise 2 (TWO)", nil, questions[1,1])
    treatises[2] = TreatiseParsed.new("Treatise 3", nil, questions[2,1])
    treatises[3] = TreatiseParsed.new("Treatise 4", nil, questions[3,1])

    parts = Array.new(2)
    parts[0] = PartParsed.new("PART 1 (First part)", nil, treatises[0..1])
    parts[1] = PartParsed.new("Part 2", nil, treatises[2..3])

    summa = SummaParsed.new(parts)
    summary = @generator.write(summa)
    assert_equal($expected_summary, summary)
  end

$expected_summary= %{# Summary

* [Introduction](README.md)

## Part 1
* [Treatise 1](part_1/treatise_1.md)
* [Treatise 2](part_1/treatise_2.md)

## Part 2
* [Treatise 3](part_2/treatise_3.md)
* [Treatise 4](part_2/treatise_4.md)
}

end
