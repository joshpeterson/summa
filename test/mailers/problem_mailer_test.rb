require 'test_helper'

class ProblemMailerTest < ActionMailer::TestCase
  test "problem email is sent" do
    email = ProblemMailer.problem_email("Unused").deliver_now
    assert_not(ActionMailer::Base.deliveries.empty?)
  end

  test "problem email from is correct" do
    email = ProblemMailer.problem_email("Unused").deliver_now
    assert_equal(["petersonjm1@gmail.com"], email.from)
  end

  test "problem email to is correct" do
    email = ProblemMailer.problem_email("Unused").deliver_now
    assert_equal(["petersonjm1@gmail.com"], email.to)
  end

  test "problem email subject is correct" do
    email = ProblemMailer.problem_email("Unused").deliver_now
    assert_equal("Summa Explorer problem report", email.subject)
  end

  test "problem email content is correct" do
    email = ProblemMailer.problem_email("foo/3").deliver_now
    assert_equal(read_fixture("problem_email").join, email.body.to_s)
  end
end
