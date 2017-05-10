module BblParser
  class Bbl
    attr_reader :boro, :block, :lot

    def initialize(boro, block, lot)
      validate_input(boro, block, lot)
      @boro = boro.to_i
      @block = block.to_i
      @lot = lot.to_i
    end

    def to_s
      "#{@boro}#{sprintf('%.5d', @block)}#{sprintf('%.4d', @lot)}"
    end

    def to_a
      [@boro, @block, @lot]
    end

    def borough
      @boro
    end

    private

    def validate_input(boro, block, lot)
      Utils.boro_check(boro)
      Utils.block_check(block)
      Utils.lot_check(lot)
    end
  end
end
