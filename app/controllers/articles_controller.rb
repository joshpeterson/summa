class ArticlesController < ApplicationController
  def show
    @article = get_article
    if (@article == nil)
      render :status => 404
    else
      @context_in_part = context_in_part
      @context_in_treatise = context_in_treatise
      @context_in_question = context_in_question
      @percent_in_part = percent_in_part
      @percent_in_treatise = percent_in_treatise
      @percent_in_question = percent_in_question
    end
  end

  def get_article
    params.has_key?(:id) ? Article.find(params[:id]) : nil
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
  def context_string(number, total)
    %(Article #{number} of #{total})
  end

  def percent(number, total)
    (number.to_f / total * 100).round
  end
end
