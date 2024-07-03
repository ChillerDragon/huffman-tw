# frozen_string_literal: true

require_relative '../lib/huffman_tw'

# rubocop:disable Metrics/BlockLength
describe 'basic' do
  describe '#compress' do
    it 'Should compress ABC correctly' do
      huffman = Huffman.new
      actual = huffman.compress('ABC')
      expect(actual).to eq([188, 181, 98, 92, 113, 3])
    end

    it 'Should compress spaces correctly' do
      huffman = Huffman.new
      actual = huffman.compress('   ')
      expect(actual).to eq([172, 89, 179, 86, 220, 0])
    end

    it 'Should compress 0x00 0x01 correctly' do
      huffman = Huffman.new
      actual = huffman.compress("\x00\x01")
      expect(actual).to eq([81, 113, 3])
    end
  end

  describe '#decompress' do
    it 'Should decompress ABC correctly' do
      huffman = Huffman.new
      actual = huffman.decompress([188, 181, 98, 92, 113, 3])
      expect(actual.map(&:chr).join).to eq('ABC')
    end

    it 'Should decompress spaces correctly' do
      huffman = Huffman.new
      spaces = huffman.compress('   ')
      actual = huffman.decompress(spaces)
      expect(actual.map(&:chr).join).to eq('   ')
    end

    it 'Should decompress 0x00 0x01 correctly' do
      huffman = Huffman.new
      compressed = huffman.compress("\x00\x01")
      actual = huffman.decompress(compressed)
      expect(actual).to eq([0, 1])
    end
  end
end
# rubocop:enable Metrics/BlockLength
