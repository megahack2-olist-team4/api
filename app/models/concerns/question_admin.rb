module QuestionAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        fields :description, :categories, :keywords, :public
      end

      edit do
        exclude_fields :related_id
      end
    end
  end
end
