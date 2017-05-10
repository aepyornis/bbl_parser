require "bbl_parser/version"
require "bbl_parser/utils"
require "bbl_parser/errors"
require "bbl_parser/bbl"

module BblParser
  # There are two ways to call this function;
  # parse(fullbll)
  # pasrse(boro, block, lot)
  def self.parse(bbl_or_boro, block = nil, lot = nil)
    if lot.nil? && block.nil?
      boro, block, lot = Utils.split_bbl(bbl_or_boro)
    else
      boro = bbl_or_boro
    end
    Bbl.new(boro, block, lot)
  end
end
