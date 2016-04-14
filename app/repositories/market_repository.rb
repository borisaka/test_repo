class MarketRepository < ROM::Repository
  relations :markets, :countries

  def [](id)
    markets.by_id(id).one
  end

  def by_id(id)
    self.[](id)
  end

  def all_for_tenant(org_id)
    markets
      .combine_children(many: countries)
      .to_a
  end

  def one_for_tenant(id, org_id)
    markets
      .by_id(id)
      .combine(many: { countries: [countries, id: :countries_id] })
      .as(:entity)
      .one
  end
end
