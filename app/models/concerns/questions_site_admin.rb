module QuestionsSiteAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        sort_by :site_id

        fields :site, :question, :answer_xpath
      end

      edit do
        configure :question do
          associated_collection_scope do
            Proc.new { |scope| scope.where({ related_id: ['', nil] }) }
          end
        end
      end
    end
  end
end
