module CountryForms
  CreateSettings = Dry::Validation.Form do
    key(:organization_id).required
    key(:country_id).required
    key(:value).required(:hash?)
  end
end
