module BblParser
  class InvalidBBLError < StandardError
  end

  class InvalidBoroughError < InvalidBBLError
  end

  class InvalidBlockError < InvalidBBLError
  end
end
