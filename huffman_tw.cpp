#include <iostream>
#include <rice/rice.hpp>

#include "teeworlds/huffman.h"

using namespace Rice;

Object huff_compress(const char * pInput, int Size)
{
    CHuffman Huffman;
    Huffman.Init();
    unsigned char aOutput[2048];
    int CompressedSize = Huffman.Compress(pInput, Size, aOutput, sizeof(aOutput));
    Array out(aOutput, aOutput + CompressedSize);
    return out;
}

Object huff_decompress(const char * pInput, int Size)
{
    CHuffman Huffman;
    Huffman.Init();
    unsigned char aOutput[2048];
    int DecompressedSize = Huffman.Decompress(pInput, Size, aOutput, sizeof(aOutput));
    Array out(aOutput, aOutput + DecompressedSize);
    return out;
}

extern "C"

void Init_huffman_tw()
{
    define_module("HuffmanTw")
        .define_module_function("huff_compress", &huff_compress)
        .define_module_function("huff_decompress", &huff_decompress);
}
