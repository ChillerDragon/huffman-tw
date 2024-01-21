#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib_huffman_tw'

include HuffmanTw

##
# The Huffman class holds compression methods.

class Huffman
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
