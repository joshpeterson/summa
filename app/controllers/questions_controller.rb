class QuestionsController < ApplicationController
  def show
    @question = get_question
    if (@question == nil)
      render :status => 404
    else
      @sorted_articles = sort_articles
      cookies["reader"] = "/questions/#{@question.id}"
    end
  end

  def get_question
    params.has_key?(:id) ? Question.find(params[:id]) : nil
  end

  def sort_articles
    @question.articles.sort_by{|a| a.id}
  end
end
