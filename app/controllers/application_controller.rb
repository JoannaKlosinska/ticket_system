class ApplicationController < ActionController::API
  before_action :authorize_request
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def authorize_request
    header = request.headers['Authorization']

    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      unauthorized
    rescue JWT::DecodeError => e
      unauthorized
    end
  end

  def unauthorized
    json_response({ errors: 'Unauthorized' }, 401)
  end

  def bad_request
    json_response({ errors: 'Bad request' }, 400)
  end

  def record_not_found
    json_response({ errors: 'Not found' }, 404)
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
