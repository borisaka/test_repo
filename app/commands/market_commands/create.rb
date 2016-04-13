module MarketCommands
  class Create < ROM::Commands::Create[:sql]
    relation :markets
    register_as :create
    result :one
  end
end
