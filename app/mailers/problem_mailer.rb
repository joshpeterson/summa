class ProblemMailer < ApplicationMailer
  default from: 'petersonjm1@gmail.com'
  def problem_email(url)
      @url = url
      mail(to: "petersonjm1@gmail.com", subject: "Summa Explorer problem report")
  end
end
