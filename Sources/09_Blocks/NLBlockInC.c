#include <stdio.h>
#include <assert.h>
#include <Block.h>

/*
 Copying Blocks
 
 As an optimization, block storage starts out on the stack—just like blocks
 themselves do. If the block is copied using Block_copy (or in Objective-C
 when the block is sent a copy), variables are copied to the heap.
 
 When you copy a block, any references to other blocks from within that
 block are copied, if necessary an entire tree may be copied (from the top).
 If you have block variables and you reference a block from within the
 block, that block will be copied.
 */

typedef int (^BlockVoidToInt)(void);

static BlockVoidToInt makeBlock()
{
  __block int value = 0;
  
  BlockVoidToInt block = ^{
    value += 1;
    return value;
  };
  return Block_copy(block);
}

void test_blocks_in_c()
{
  BlockVoidToInt block = makeBlock();
  assert(block() == 1);
  assert(block() == 2);
  Block_release(block);
}
