#!/usr/bin/env ruby
# frozen_string_literal: true

begin
  # works for me for both system installed gems
  # and also for the local dev version
  require_relative '../lib_huffman_tw'
rescue
  # ensures the gem works on systems
  # where the native extensions end up
  # in a totally different path than the gems ruby code
  require 'lib_huffman_tw'
end

##
# The Huffman class holds compression methods.
class Huffman
  include HuffmanTw

  ##
  # Compresses given data using the huffman algorithm.
  #
  # The +data+ has to be of type +String+
  #
  # The returned value will be an +Array+ of +Integers+
  #
  # An ArgumentError is raised if the data exceeds the maximum size of 2048
  def compress(data)
    raise 'Data has to be a string' if data.class != String

    huff_compress(data, data.size)
  end

  ##
  # Decompresses given data using the huffman algorithm.
  #
  # The +data+ has to be an +Array+ of +Inetegers+
  #
  # The returned value will be an +Array+ of +Integers+
  #
  # An ArgumentError is raised if the data exceeds the maximum size of 2048
  def decompress(data)
    raise 'Data has to be an Array of bytes' if data.class != Array

    data = data.pack('C*')
    huff_decompress(data, data.size)
  end
end
