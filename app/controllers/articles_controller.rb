class ArticlesController < ApplicationController
  def show
    @article = article
    if @article.nil?
      render status: 404
    else
      @next = next_article
      @previous = previous_article
      @context_in_part = context_in_part
      @context_in_treatise = context_in_treatise
      @context_in_question = context_in_question
      @percent_in_part = percent_in_part
      @percent_in_treatise = percent_in_treatise
      @percent_in_question = percent_in_question
      @sorted_objections = sort_objections
      @article.answer = process_html(@article.answer)
      cookies['reader'] = { value: "/articles/#{@article.id}",
                            expires: 1.year.from_now }
    end
  end

  def article
    get_article_with_offset(0)
  end

  def next_article
    get_article_with_offset(1)
  end

  def previous_article
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
    params.key?(:id) ? Article.find_by(id: params[:id].to_i + offset) : nil
  end

  def context_string(number, total)
    %(Article #{number} of #{total})
  end

  def percent(number, total)
    (number.to_f / total * 100).round
  end

  def replace_each_empty_line_with_two_br_tags(text)
    text.gsub(/^\n/, '<br><br>')
  end

  def sort_objections
    @article.objections.sort_by { |o| o.statement || '' }
  end
end
