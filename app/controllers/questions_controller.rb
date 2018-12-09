# frozen_string_literal: true

class QuestionsController < ApplicationController
  def show
    @question = question
    if @question.nil?
      render status: :not_found
    else
      @sorted_articles = sort_articles
      cookies['reader'] = "/questions/#{@question.id}"
    end
  end

  def question
    params.key?(:id) ? Question.find(params[:id]) : nil
  end

  def sort_articles
    @question.articles.sort_by(&:id)
  end
end
