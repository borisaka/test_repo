class Markets < ROM::Relation[:sql]
  use :key_inference
  gateway :postgres

  def by_id(id)
    where(id: id)
  end

  private

  def primary_key
    :id
  end
end
