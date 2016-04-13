module Api
  module V1
    class BaseController < ApplicationController
      include Api::ExceptionsHandler
      protect_from_forgery with: :null_session

      protected

      def container
        WheelsApp.instance
      end
    end
  end
end
