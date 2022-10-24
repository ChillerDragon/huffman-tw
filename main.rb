#!/usr/bin/env ruby

require_relative "huffman_tw"

include HuffmanTw

puts huff_compress("hello world", 2)
