#!/usr/bin/env ruby

require_relative "huffman_tw"

include HuffmanTw

data = "hello world"

puts "input: #{data}"
compressed = huff_compress(data, data.size)

puts "compressed: #{compressed}"
compressed = compressed.pack("C*")
decompressed = huff_decompress(compressed, compressed.size)

puts "decompressed: #{decompressed.map(&:chr).join('')}"
