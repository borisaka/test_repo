class Countries < ROM::Relation[:memory]
  use :key_inference
  use :view

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

  view(:base, ATTRIBUTES) { self }

  view(:for_markets, [:id, :market_id, :name]) do |markets|
    dataset = markets.flat_map do |market|
      restrict(id: market[:countries_id].to_a)
        .map { |t| t.merge(market_id: market[:id]) }
    end
    __new__(dataset)
  end

  private

  def primary_key
    :id
  end
end
