#import "NLPerson.h"

@implementation NLPerson

- (instancetype)initWithName:(NSString*)name
{
  self = [super init];
  if (self) {
    self->_name = name;
  }
  return self;
}

@end
