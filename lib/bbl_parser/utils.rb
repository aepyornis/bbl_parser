module BblParser
  module Utils
    def self.block_check(block)
      return true if block.to_i.between?(1, 99999)
      raise InvalidBlockError
    end

    def self.boro_check(boro)
      return true if boro.to_i.between?(1,5)
      raise InvalidBoroughError
    end
  end
end
