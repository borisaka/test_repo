module Api
  module ExceptionsHandler
    extend ActiveSupport::Concern

    included do
      # NOTE: rescue_from StandardError has to be at the top because
      #       rails returns last rescue_from matching value.
      #       Moving rescue_from StandardError to the bottom will cause that every
      #       received error will have status 500.
      rescue_from StandardError, with: :error_occured
    end

    protected

    def validation_error(exception)
      render json: { error: exception.message }, status: 422
    end

    def error_occured(e)
      raise e unless Rails.env.production?
      Raven.capture_exception(e)
      render json: { error: "Something went wrong" }, status: 500
    end
  end
end
