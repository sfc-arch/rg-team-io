class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  private

  def require_api_key
    key = ApiKey.active.find_by(access_token: params[:access_token])
    return if key.present?
    render json: { error: 'Need valid API key.' }, status: 401
  end
end
