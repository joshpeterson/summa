class EmailerController < ApplicationController
  def problem_email
    ProblemMailer.problem_email(params[:url]).deliver_now
  end

end
