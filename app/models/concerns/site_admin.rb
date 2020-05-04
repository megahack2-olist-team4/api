module SiteAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        fields :name, :url
      end

      edit do
        fields :name, :description, :url
      end
    end
  end
end
