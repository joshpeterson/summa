class ArticlesController < ApplicationController
  def show
    @article = get_article
    if (@article == nil)
      render :status => 404
    else
      @next = get_next
      @previous = get_previous
      @context_in_part = context_in_part
      @context_in_treatise = context_in_treatise
      @context_in_question = context_in_question
      @percent_in_part = percent_in_part
      @percent_in_treatise = percent_in_treatise
      @percent_in_question = percent_in_question
      @article.answer = process_html(@article.answer)
    end
  end

  def get_article
    get_article_with_offset(0)
  end

  def get_next
    get_article_with_offset(1)
  end

  def get_previous
    get_article_with_offset(-1)
  end

  def process_html(text)
    replace_each_empty_line_with_two_br_tags(text)
  end

  def context_in_question
    number = @article.context.number_in_question
    total = @article.context.question.number_of_articles
    context_string(number, total)
  end

  def percent_in_question
    number = @article.context.number_in_question
    total = @article.context.question.number_of_articles
    percent(number, total)
  end

  def context_in_treatise
    number = @article.context.number_in_treatise
    total = @article.context.treatise.number_of_articles
    context_string(number, total)
  end

  def percent_in_treatise
    number = @article.context.number_in_treatise
    total = @article.context.treatise.number_of_articles
    percent(number, total)
  end

  def context_in_part
    number = @article.context.number_in_part
    total = @article.context.part.number_of_articles
    context_string(number, total)
  end

  def percent_in_part
    number = @article.context.number_in_part
    total = @article.context.part.number_of_articles
    percent(number, total)
  end

  private

  def get_article_with_offset(offset)
    params.has_key?(:id) ? Article.find_by(id: params[:id].to_i + offset) : nil
  end

  def context_string(number, total)
    %(Article #{number} of #{total})
  end

  def percent(number, total)
    (number.to_f / total * 100).round
  end

  def replace_each_empty_line_with_two_br_tags(text)
    text.gsub(/^\n/, "<br><br>")
  end
end
