require "spec_helper"

RSpec.describe BblParser::Bbl do
  describe 'initalize' do
    it 'has boro block lot' do
      bbl = BblParser::Bbl.new(1,10,100)
      expect(bbl.boro).to eq 1
      expect(bbl.block).to eq 10
      expect(bbl.lot).to eq 100
    end

    it 'has boro alias borough' do
      bbl = BblParser::Bbl.new(1,10,100)
      expect(bbl.borough).to eq 1
    end
  end

  describe 'to_s' do
    it 'converts to 10 char string' do
      bbl = BblParser::Bbl.new(3,20,500)
      expect(bbl.to_s).to eq '3000200500'
    end
  end

  describe 'to_a' do
    it 'returns an array' do
      expect(BblParser::Bbl.new(3,20,500).to_a).to eq [3, 20, 500]
    end
  end
end
