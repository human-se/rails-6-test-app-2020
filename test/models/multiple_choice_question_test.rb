# == Schema Information
#
# Table name: questions
#
#  id           :bigint           not null, primary key
#  answer       :string
#  distractor_1 :string
#  distractor_2 :string
#  question     :string
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  quiz_id      :integer
#

require 'test_helper'

class MultipleChoiceQuestionTest < ActiveSupport::TestCase
  test "multiple choice question should be valid" do
    question = questions(:two)
    assert question.valid?, question.errors.full_messages.inspect
  end

  test "question must be present" do
    question = questions(:two)
    question.question = nil
    assert_not question.valid?, question.errors.full_messages.inspect
    assert question.errors.count == 1, question.errors.full_messages.inspect
    assert question.errors.of_kind?(:question, :blank), question.errors.full_messages.inspect
  end

  test "answer must be present" do
    question = questions(:two)
    question.answer = nil
    assert_not question.valid?, question.errors.full_messages.inspect
    assert question.errors.count == 1, question.errors.full_messages.inspect
    assert question.errors.of_kind?(:answer, :blank), question.errors.full_messages.inspect
  end

  test "distractor_1 must be present" do
    question = questions(:two)
    question.distractor_1 = nil
    assert_not question.valid?, question.errors.full_messages.inspect
    assert question.errors.count == 1, question.errors.full_messages.inspect
    assert question.errors.of_kind?(:distractor_1, :blank), question.errors.full_messages.inspect
  end

  test "multiple choice question must have parent quiz" do
    question = questions(:two)
    question.quiz = nil
    assert_not question.valid?, question.errors.full_messages.inspect
    assert question.errors.count == 1, question.errors.full_messages.inspect
    assert question.errors.of_kind?(:quiz, "must exist"), question.errors.full_messages.inspect
  end
end
