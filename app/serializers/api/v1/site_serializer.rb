class Api::V1::SiteSerializer
  include FastJsonapi::ObjectSerializer

  has_many :questions_sites, { serializer: Api::V1::QuestionSerializer, record_type: 'question' }

  attributes :name, :description, :url

  link :self do |object|
    Rails.application.routes.url_helpers.api_v1_site_path(object)
  end
end
