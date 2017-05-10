module BblParser
  class InvalidBBLError < StandardError
  end

  class InvalidBoroughError < InvalidBBLError
  end

  class InvalidBlockError < InvalidBBLError
  end

  class InvalidLotError < InvalidBBLError
  end
end
