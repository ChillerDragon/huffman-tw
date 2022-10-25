#include <iostream>
#include <rice/rice.hpp>

#include "teeworlds/huffman.h"

using namespace Rice;

#define MAX_DATA_SIZE 2048

int check_size(int Size)
{
    if (Size < MAX_DATA_SIZE)
        return 1;

    // TODO: fallback to memory allocation
    //       instead of error
    Object o;
    String str("Data size is too big (maximum 2048)");
    o.call("raise", str);
    return 0;
}

Object huff_compress(const char * pInput, int Size)
{
    if (!check_size(Size))
        return Qnil;

    CHuffman Huffman;
    Huffman.Init();
    unsigned char aOutput[2048];
    int CompressedSize = Huffman.Compress(pInput, Size, aOutput, sizeof(aOutput));

    if (!check_size(CompressedSize))
        return Qnil;

    Array out(aOutput, aOutput + CompressedSize);
    return out;
}

Object huff_decompress(const char * pInput, int Size)
{
    if (!check_size(Size))
        return Qnil;

    CHuffman Huffman;
    Huffman.Init();
    unsigned char aOutput[2048];
    int DecompressedSize = Huffman.Decompress(pInput, Size, aOutput, sizeof(aOutput));

    if (!check_size(DecompressedSize))
        return Qnil;

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
