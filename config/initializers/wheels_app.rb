WheelsApp.configure do |container|
  container.register("persistence") do
    ROM.env
  end
  # Countries registration
  container.register("repositories.country") do
    CountryRepository.new(container["persistence"])
  end

  # Markets registration
  container.register("repositories.market") do
    MarketRepository.new(container["persistence"])
  end

  container.register("persistence.commands.markets") do
    container["persistence"].command(:markets)
  end

  container.register("persistence.commands.create_market") do
    container["persistence.commands.markets"][:create]
  end
end
