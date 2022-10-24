#include <iostream>
#include <rice/rice.hpp>

#include "teeworlds/huffman.h"

using namespace Rice;

Object huff_compress(const char * pInput, int Size)
{
    CHuffman Huffman;
    Huffman.Init();
    unsigned char aOutput[2048];
    Huffman.Compress(pInput, Size, aOutput, sizeof(aOutput));
    Array out(aOutput, aOutput + Size);
    return out;
}

extern "C"

void Init_huffman_tw()
{
    define_module("HuffmanTw")
        .define_module_function("huff_compress", &huff_compress);
}

