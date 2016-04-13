module MarketForms
  CreateMarkets = Dry::Validation.Form do
    key(:code).required
    key(:name).required
    key(:countries_id).required
    key(:description).required
  end
end
