require "spec_helper"

RSpec.describe BblParser do
  it "has a version number" do
    expect(BblParser::VERSION).not_to be nil
  end

  describe 'helper methods' do
    describe 'split_bbl' do
      it 'if 10 chars, that are all numbers, split based on 1-5-4' do
        expect(BblParser::Utils.split_bbl('1543210001')).to eq [1, 54321, 1]
      end

      it 'accepts - as delimiter' do
        expect(BblParser::Utils.split_bbl('4-1234-0050')).to eq [4, 1234, 50]
        expect(BblParser::Utils.split_bbl('4-600-4')).to eq [4, 600, 4]
      end

      it 'raises error if cannot parse' do
        expect { BblParser::Utils.split_bbl('200') }
          .to raise_error(BblParser::InvalidBBLError)

        expect { BblParser::Utils.split_bbl('i am not a bbl') }
          .to raise_error(BblParser::InvalidBBLError)
      end
      
    end


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

    describe 'block_check' do
      it 'works with valid blocks' do
        [1, 20, 333, 3943, 99999].each do |i|
          expect(BblParser::Utils.block_check(i)).to eql true
        end
      end

      it 'rejects invalid blocks' do
        expect { BblParser::Utils.block_check(0) }
          .to raise_error(BblParser::InvalidBlockError)
        expect { BblParser::Utils.block_check(100000) }
          .to raise_error(BblParser::InvalidBlockError)
      end
    end

    describe 'lot_check' do
      it 'works with valid lots' do
        [1, 20, 333, 3943, 9999].each do |i|
          expect(BblParser::Utils.lot_check(i)).to eql true
        end
      end

      it 'rejects invalid blocks' do
        expect { BblParser::Utils.lot_check(0) }
          .to raise_error(BblParser::InvalidLotError)
        expect { BblParser::Utils.lot_check(10000) }
          .to raise_error(BblParser::InvalidLotError)
      end
    end
  end

end
