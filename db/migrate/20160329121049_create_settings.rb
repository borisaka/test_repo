ROM::SQL.migration do
  change do
    create_table :settings do
      primary_key :id
      column :value, :json
      column :currency_id, String
      column :country_id, String
      column :market_id, Integer
      column :organization_id, String, null: false
    end
  end
end
