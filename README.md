# huffman-tw

The teeworlds C++ huffman compression code wrapped as a ruby gem 

## Build the library

You need ``make``, ``ruby`` and a C++ compiler installed.

    gem install rice
    ruby extconf.rb
    make
    ruby main.rb

## Methods

``Huffman.compress(data)``

Takes a String as argument. The String will then be handled as a ``unsigned char *`` and compressed. The returned value is an Array of Integers.

``Huffman.decompress(data)``

Takes a Array or Inetegers as argument. It will then pack it as a ``unsigned char *`` and return an Array of Integers.

## Use the library

```ruby
require "huffman_tw"

huff = Huffman.new
data = huff.compress("hello world")
data = huff.decompress(data)

p data
p data.map(&:chr).join('')
```

```
[104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]
"hello world"
```

## DISCLAIMER

This is neither optimized for speed, safety nor ease of use. While this can be used as a compression library it is not recommended to do so. The goal of this project is to have the exact teeworlds compression code accessible via ruby to develop teeworlds related projects in ruby.
