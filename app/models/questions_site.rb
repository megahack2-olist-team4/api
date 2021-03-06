class QuestionsSite < ApplicationRecord
  include QuestionsSiteAdmin

  default_scope { joins(:question) }

  belongs_to :question
  belongs_to :site

  delegate :description, :keywords, :public, to: :question, allow_nil: true
end
