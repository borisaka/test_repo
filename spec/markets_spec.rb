ENV['RAILS_ENV'] = 'test'

require_relative '../config/environment'

RSpec.describe MarketRepository do
  subject(:repo) { MarketRepository.new(rom) }

  let(:rom) { ROM.env }

  let(:countries) { rom.relations[:countries].take(2).to_a }
  let(:markets) { rom.relations[:markets] }

  describe '#all_for_tenant' do
    before do
      markets.insert(
        name: 'test',
        code: 'test',
        description: 'test',
        countries_id: Sequel.pg_array(countries.map { |t| t[:id] })
      )
    end

    it 'works' do
      market = repo.all_for_tenant(nil).first

      expect(market.countries.count).to be(2)

      expect(market.countries[0].id).to eql(countries[0][:id])
      expect(market.countries[1].id).to eql(countries[1][:id])
    end
  end
end
