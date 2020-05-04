module ProductAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        fields :category, :name
      end
    end
  end
end
