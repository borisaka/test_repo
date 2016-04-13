module Api
  module V1
    class MarketsController < BaseController
      class ValidationError < StandardError; end

      def index
        markets = market_repo.all_for_tenant(tenant)
        render json: markets
      end

      def create
        market_form = MarketForms::CreateMarkets.call(market_params)
        raise ValidationError, market_form.messages if market_form.failure?
        market = create_market.call(market_form.output)
        render json: market
      end

      private

      def market_params
        {
          countries_id: Sequel.pg_array(params["countries_id"]),
          code: params["code"],
          name: params["name"],
          description: params["description"],
        }
      end

      def container
        WheelsApp.instance
      end

      def market_repo
        container["repositories.market"]
      end

      def create_market
        container["persistence.commands.create_market"]
      end

      def tenant
        "mock"
      end
    end
  end
end
