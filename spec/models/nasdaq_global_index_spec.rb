require 'rails_helper'

RSpec.describe NasdaqGlobalIndex, type: :model do
  describe "#get_monthly_historical_range" do
    it "should make http request to Quandal API service" do
      stub_request(:any, /quandl.com/).
        to_return(body: File.read(File.join('spec','fixtures', 'fake_quandal_nqgi_data.json')))
      
      expect(NasdaqGlobalIndex.get_index).to be_a(Array)
      expect(NasdaqGlobalIndex.get_index.first[0]).to be_a(String)
      expect(NasdaqGlobalIndex.get_index.first[1]).to be_a(Float)
    end
  end
end