class Article
  def initialize(title, contrary, answer, objections)
    @title = title
    @contrary = contrary
    @answer = answer
    @objections = objections
  end

  attr_reader :title
  attr_reader :contrary
  attr_reader :answer
  attr_reader :objections
end
