require "spec_helper"

RSpec.describe BblParser do
  it "has a version number" do
    expect(BblParser::VERSION).not_to be nil
  end

  describe 'helper methods' do
    describe 'boro_check' do
      it 'accepts valid numbers' do
        [1,2,3,4,5, '1', '2', '3','4', '5'].each do |i|
          expect(BblParser::Utils.boro_check(i)).to eql true
        end
      end

      it 'rejects invalid numbers' do
        [0, 6, 100].each do |i|
          expect { BblParser::Utils.boro_check(i) }
            .to raise_error(BblParser::InvalidBoroughError)
        end
      end
    end
  end

  describe 'block_check' do
    it 'works with valid blocks' do
      [1, 20, 333, 3943, 99999].each do |i|
        expect(BblParser::Utils.block_check(i)).to eql true
      end
    end

    it 'projects invalid blocks' do
      expect { BblParser::Utils.block_check(0) }
        .to raise_error(BblParser::InvalidBlockError)
      expect { BblParser::Utils.block_check(100000) }
        .to raise_error(BblParser::InvalidBlockError)
    end
  end
end
