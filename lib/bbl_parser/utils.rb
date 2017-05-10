module BblParser
  module Utils
    def self.split_bbl(bbl)
      if /[0-9]{10}/ =~ bbl
        [bbl[0], bbl[1..5], bbl[6..9]].map(&:to_i)
      elsif bbl.scan(/-/).count == 2
        bbl.split('-').map(&:to_i)
      else
        raise BblParser::InvalidBBLError, "cannot parse bbl: #{bbl}"
      end
    end

    def self.boro_check(boro)
      return true if boro.to_i.between?(1,5)
      raise BblParser::InvalidBoroughError
    end
    

    def self.block_check(block)
      return true if block.to_i.between?(1, 99999)
      raise BblParser::InvalidBlockError
    end

    def self.lot_check(lot)
      return true if lot.to_i.between?(1, 9999)
      raise BblParser::InvalidLotError
    end


  end
end
