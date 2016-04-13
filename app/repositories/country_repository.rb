class CountryRepository < ROM::Repository
  relations :countries

  def [](id)
    countries.by_id(id).one
  end

  def by_id(id)
    self.[](id)
  end
end
