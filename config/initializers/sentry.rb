Raven.configure do |config|
  config.dsn = ENVied.SENTRY_DSN
  config.environments = %W(production)
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.tags = { environment: Rails.env }
end
