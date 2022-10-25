# frozen_string_literal: true

require 'rake'

Gem::Specification.new do |s|
  s.name        = 'huffman_tw'
  s.version     = '0.0.1'
  s.summary     = 'The teeworlds C++ huffman compression code wrapped as a ruby gem'
  s.description = <<-DESC
  The teeworlds C++ huffman compression code wrapped as a ruby gem

  This gem implements the huffman compression algorithm. Using the exact code of the teeworlds codebase.
  https://github.com/teeworlds/teeworlds/blob/26d24ec061d44e6084b2d77a9b8a0a48e354eba6/src/engine/shared/huffman.cpp

  So this gem is ideal for developing teeworlds projects in ruby. But this is not a general purpose compression library.
  Do not expect speed/ease of use/safety/correctness but just being as close to the teeworlds implementation as possible.
  DESC
  s.authors     = ['ChillerDragon']
  s.email       = 'ChillerDragon@gmail.com'
  s.extensions  = ['extconf.rb']
  s.files       = FileList[
    'main.rb',
    'huffman_tw.cpp',
    'teeworlds/huffman.h'
  ]
  s.required_ruby_version = '>= 3.1.2'
  s.add_dependency 'rice', '~> 4.0.4'
  s.homepage    = 'https://github.com/ChillerDragon/huffman-tw'
  s.license     = 'Unlicense'
  s.metadata['rubygems_mfa_required'] = 'true'
end
