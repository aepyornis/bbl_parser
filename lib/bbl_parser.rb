require "bbl_parser/version"
require "bbl_parser/utils"
require "bbl_parser/errors"

module BblParser
  # There are two ways to call this function;
  # parse(fullbll)
  # pasrse(boro, block, lot)
  def self.parse(bbl_or_block, block = nil, lot = nil)
    if lot.nil? && block.nil?
      bbl = bbl_or_block
    else
      block = bbl_or_block
    end
    
    Utils.boro_check(boro)
  end
end
