class Question < ApplicationRecord
  include QuestionAdmin

  has_and_belongs_to_many :categories
  has_many :relateds, class_name: 'Question', foreign_key: 'related_id'

  alias_attribute :title, :description
end
