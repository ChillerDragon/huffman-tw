# frozen_string_literal: true

require_relative '../lib/huffman_tw'

describe 'empty' do
  describe '#compress' do
    it 'Should return nil if given an empty string' do
      huffman = Huffman.new
      actual = huffman.compress('')
      expect(actual).to eq(nil)
    end
  end

  describe '#decompress' do
    it 'Should return nil if given an empty array' do
      huffman = Huffman.new
      actual = huffman.decompress([])
      expect(actual).to eq(nil)
    end
  end
end
