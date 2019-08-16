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

class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :title, presence: true
end
