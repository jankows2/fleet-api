module V1
  class BaseController < ActionController::Base
    respond_to :json

    rescue_from ActiveRecord::RecordInvalid do |exception|
      @object = exception.record
      render status: 400, template: 'v1/errors/record_invalid'
    end

    rescue_from ActiveRecord::RecordNotFound do
      @object = Object.new
      render status: 404, template: 'v1/errors/record_not_found'
    end

    private

    def current_user
      if Rails.env.test?
        @current_user ||= User.find_by(id: 1)
      elsif doorkeeper_token
        @current_user ||= User.find(doorkeeper_token.resource_owner_id)
      end
    end

    def access_denied
      render status: 403, template: 'v1/errors/not_privileged'
    end
  end
end
