ROM::Rails::Railtie.configure do |config|
  config.gateways[:postgres] = [
    :sql, ENVied.DATABASE_URL,
    not_inferrable_relations: [:schema_migrations],
    extensions: [:pg_json, :pg_array],
  ]
  config.gateways[:memory] = :memory
end
