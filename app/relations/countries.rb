class Countries < ROM::Relation[:memory]
  use :key_inference
  gateway :memory

  ATTRIBUTES = [:name, :id].freeze

  dataset do
    data = ISO3166::Country.all_names_with_codes.map do |country|
      Hash[*ATTRIBUTES.zip(country).flatten]
    end
    ROM::Memory::Dataset.new(data)
  end

  def by_id(id)
    restrict(id: id.upcase)
  end

  def for_markets(markets)
    restrict(id: markets.one[:countries_id].to_a)
  end

  private

  def primary_key
    :id
  end

  def attributes
    ATTRIBUTES
  end
end
