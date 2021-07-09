#import "NLGenericStack.h"

@interface NLGenericStack ()

@property NSMutableArray* array;

@end

@implementation NLGenericStack

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.array = [NSMutableArray new];
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
