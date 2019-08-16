# == Schema Information
#
# Table name: quizzes
#
#  id              :bigint           not null, primary key
#  description     :text
#  questions_count :integer
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  test "quiz should be valid" do
    quiz = quizzes(:one)
    assert quiz.valid?, quiz.errors.full_messages.inspect
  end

  test "title must be present" do
    quiz = quizzes(:one)
    quiz.title = nil
    assert_not quiz.valid?, quiz.errors.full_messages.inspect
    assert quiz.errors.count == 1, quiz.errors.full_messages.inspect
    assert quiz.errors.of_kind?(:title, :blank), quiz.errors.full_messages.inspect
  end

  test "quiz with no questions should be valid" do
    quiz = quizzes(:two)
    assert quiz.valid?, quiz.errors.full_messages.inspect
  end

end
