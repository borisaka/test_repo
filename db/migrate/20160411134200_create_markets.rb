ROM::SQL.migration do
  change do
    create_table :markets do
      primary_key :id
      column :code, String, null: false
      column :name, String, null: false
      column :countries_id, 'Text[]'
      column :description, String, null: false
    end
  end
end
