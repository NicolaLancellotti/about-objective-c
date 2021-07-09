#import "NLClassWithExtension.h"
#import "NLClassWithExtension_Extension.h"

@implementation NLClassWithExtension

- (void)method
{
  
}

@end

void test_extensions()
{
  NLClassWithExtension *instance = [NLClassWithExtension new];
  [instance method];
  instance.property = @"Hello, World!";
}
