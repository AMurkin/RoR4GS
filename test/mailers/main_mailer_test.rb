require 'test_helper'

class MainMailerTest < ActionMailer::TestCase
  test "notify_question_author" do
    mail = MainMailer.notify_question_author
    assert_equal "New answer to your question", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
