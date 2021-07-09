#import <Foundation/Foundation.h>

void test_blocks()
{
  {
    /*
     If you don’t explicitly declare the return value of a block expression,
     it can be automatically inferred from the contents of the block.
     */
    int (^block)(int) = ^ int (int num) {
      return num / 2;
    };
    
    assert(block(10) == 5);
  }
  
  {
    /*
     If the return type is inferred and the parameter list is void, then you
     can omit the (void) parameter list as well.
     */
    void (^block)(void) = ^ { };
    
    block();
  }
  
  {
    // Blocks can capture values from the enclosing scope
    int value = 1;
    
    int (^block)(void) = ^{
      return value;
    };
    
    assert(block() == value);
  }
  
  {
    /*
     Use __block variables to share storage.
     They cannot be variable length arrays, and cannot be structures that
     contain C99 variable-length arrays.
     */
    __block int value = 0;
    
    int (^block)(void) = ^{
      value += 1;
      return value;
    };
    
    assert(block() == 1);
    assert(block() == 2);
    assert(value == 2);
  }
}

#pragma mark - Manual Retain Release

/*
 Patterns to Avoid in MRR environment
 
 A block literal (that is, ^{ ... }) is the address of a stack-local data
 structure that represents the block. The scope of the stack-local data
 structure is therefore the enclosing compound statement, so you should
 avoid the patterns shown in the following examples:
 */

void dontDoThis()
{
  void (^blockArray[3])(void);  // An array of 3 block references
  
  for (int i = 0; i < 3; ++i) {
    blockArray[i] = ^{
      printf("hello, %d\n", i);
    };
    // WRONG: The block literal scope is the "for" loop.
  }
}

void dontDoThisEither()
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

#pragma mark - Block Properties

@interface NLBlock : NSObject

typedef void (^BlockVoidToVoid)(void);
/*
 You should specify copy as the property attribute, because a block needs to be
 copied to keep track of its captured state outside of the original scope.
 This isn’t something you need to worry about when using Automatic Reference
 Counting, as it will happen automatically, but it’s best practice for the
 property attribute to show the resultant behavior.
 */
@property (copy) BlockVoidToVoid block;

@property NSString *value;

@end

@implementation NLBlock

- (void)blockWithinTheImplementationOfAMethod
{
  {
    // If you access an instance variable by reference, a strong reference is
    // made to self
    BlockVoidToVoid block =  ^{
      NSLog(@"%@", _value); // a strong reference is made to self
    };
  }
  {
    // If you access an instance variable by value, a strong reference is made
    // to the variable
    NSString *value = self.value;
    BlockVoidToVoid block =  ^{
      NSLog(@"%@", value); // a strong reference is made to value
    };
  }
  {
    __weak typeof(self) weakSelf = self;
    
    self.block = ^{
      __strong typeof(self) strongSelf = weakSelf;
      NSLog(@"%@", strongSelf.value);
    };
  }
}

@end
