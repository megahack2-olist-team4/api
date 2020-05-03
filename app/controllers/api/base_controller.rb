
class Api::BaseController < ActionController::API
  include ActionController::MimeResponds

  rescue_from ActiveRecord::RecordNotFound do |exception|
    data = YAML.safe_load(exception.message)

    render({
      status: :not_found,
      json: {
        errors: [{
          status: 404,
          detail: data['message'],
        }],
      },
    })
  end

  respond_to :json
end
