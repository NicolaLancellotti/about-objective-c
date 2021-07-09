#import "NLGenericStack.h"

@interface NLGenericStack ()

@property NSMutableArray* array;

@end

@implementation NLGenericStack

- (instancetype)init
{
  self = [super init];
  if (self) {
    self->_array = [NSMutableArray new];
  }
  return self;
}

/* 
 The id type defines a generic object pointer
 See NLMiscellaneous - Dynamic Language
 */
- (void)push:(id)object
{
  [self.array addObject:object];
}

- (id)pop
{
  NSUInteger index = self.array.count - 1;
  if (index == -1) {
    return nil;
  }
  
  id last = self.array[index];
  [self.array removeLastObject];
  return last;
}

@end

void test_generics()
{
  NLGenericStack<NSString*> *stack = [NLGenericStack new];
  [stack push:@"0"];
  [stack push:@"1"];
  assert([[stack pop] isEqual:@"1"]);
  assert([[stack pop] isEqual:@"0"]);
}
