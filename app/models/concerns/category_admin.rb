module CategoryAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        fields :name
        field :keywords_str, :string do
          label 'Keywords'
        end
      end

      edit do
        fields :name, :description
        field :keywords_str, :string do
          label 'Keywords'
          help 'User comma (,) to separate items.'
        end
      end
    end
  end
end
