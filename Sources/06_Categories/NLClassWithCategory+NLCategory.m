#import "NLClassWithCategory+NLCategory.h"

@implementation NLClassWithCategory (NLCategory)

- (void)nl_method
{
  
}

@end

void test_categories()
{
  NLClassWithCategory *instance = [NLClassWithCategory new];
  [instance nl_method];
}
