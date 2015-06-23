class Question
  def initialize(title, content, articles)
    @title = title
    @content = content
    @articles = articles
  end

  attr_reader :title
  attr_reader :content
  attr_reader :articles
end
