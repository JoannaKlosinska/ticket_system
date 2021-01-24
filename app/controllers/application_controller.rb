class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    json_response({ errors: 'Not found' }, 404)
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
