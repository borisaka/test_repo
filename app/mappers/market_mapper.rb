class MarketMapper < ROM::Mapper
  relation :markets
  register_as :entity
  reject_keys false
  step do
    attribute :id
    attribute :code
    attribute :name
    attribute :description
  end
end
