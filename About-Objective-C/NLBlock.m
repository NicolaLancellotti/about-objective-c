#import "NLBlock.h"

void NLBlockFunction(void)
{
  /*
   If you don’t explicitly declare the return value of a block expression,
   it can be automatically inferred from the contents of the block.
   */
  double (^myBlock0)(int) = ^ double (int num) {
    return num / 0.5;
  };
  
  myBlock0(1);
  
  /*
   If the return type is inferred and the parameter list is void, then you
   can omit the (void) parameter list as well.
   */
  
  void (^myBlock1)(void) = ^ {
    
  };
  
  myBlock1();
  
  
  // Blocks Can Capture Values from the Enclosing Scope
  
  int anInteger1 = 42;
  void (^testBlock)(void) = ^{
    NSLog(@"Integer is: %i", anInteger1);
  };
  
  testBlock();
  
  /*
   Use __block Variables to Share Storage
   
   They cannot be variable length arrays,
   and cannot be structures that contain C99 variable-length arrays.
   */
  __block int anInteger2 = 42;
  
  void (^testBlock2)(void) = ^{
    NSLog(@"Integer is: %i", anInteger2);
    anInteger2 = 100;
  };
  
  testBlock2();
  
  /*
   Copying Blocks
   
   As an optimization, block storage starts out on the stack—just like blocks
   themselves do. If the block is copied using Block_copy (or in Objective-C
   when the block is sent a copy), variables are copied to the heap
   
   When you copy a block, any references to other blocks from within that
   block are copied if necessary—an entire tree may be copied (from the top).
   If you have block variables and you reference a block from within the block,
   that block will be copied.
   */
  
  Block_copy(&myBlock0);
  Block_release(&myBlock0);
  
}

/*
 Patterns to Avoid in MRR environment
 
 A block literal (that is, ^{ ... }) is the address of a stack-local data
 structure that represents the block. The scope of the stack-local data
 structure is therefore the enclosing compound statement, so you should
 avoid the patterns shown in the following examples:
 */

void dontDoThis(void)
{
  void (^blockArray[3])(void);  // an array of 3 block references
  
  for (int i = 0; i < 3; ++i) {
    blockArray[i] = ^{
      printf("hello, %d\n", i);
    };
    // WRONG: The block literal scope is the "for" loop.
  }
}

void dontDoThisEither(void)
{
  void (^block)(void);
  
  long i = random();
  if (i > 1000) {
    block = ^{
      printf("got i at: %ld\n", i);
    };
    // WRONG: The block literal scope is the "then" clause.
  }
}

typedef void (^MyBlockType)(void);

@interface NLBlock ()

/*
 You should specify copy as the property attribute, because a block needs to be
 copied to keep track of its captured state outside of the original scope.
 This isn’t something you need to worry about when using Automatic Reference Counting,
 as it will happen automatically, but it’s best practice for the property attribute
 to show the resultant behavior.
 */
@property (copy) void (^blockProperty)(void);

@end

@implementation NLBlock

/*
 If you use a block within the implementation of a method:
 
 If you access an instance variable by reference, a strong reference is made to self;
 If you access an instance variable by value, a strong reference is made to the variable.
 */

// Avoid Strong Reference Cycles when Capturing self
- (void)configureBlock
{
  __weak typeof(self) weakSelf = self;
  self.blockProperty = ^{
    __strong typeof(self) strongSelf = weakSelf;
    [strongSelf doSomething];   // capture the weak reference
  };
}

- (void)doSomething
{
  
}

@end
