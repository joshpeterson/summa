class QuestionsController < ApplicationController
  def show
    @question = get_question
    if (@question == nil)
      render :status => 404
    end
  end

  def get_question
    params.has_key?(:id) ? Question.find(params[:id]) : nil
  end
end
