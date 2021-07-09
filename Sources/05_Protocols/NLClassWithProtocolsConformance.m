#import "NLClassWithProtocolsConformance.h"

@implementation NLClassWithProtocolsConformance

#pragma mark - Conforming to Protocol1

- (void)requiredMethod1
{
  
}

- (void)requiredMethod2
{
  
}

#pragma mark - Conforming to Protocol2

- (void)requiredMethod3
{
  
}

@end

void test_protocols(void)
{
  NLClassWithProtocolsConformance *instance = [NLClassWithProtocolsConformance new];
  
  [instance requiredMethod1];
  [instance.delegate requiredMethod1];
  
  // Check that optional methods are implemented at runtime
  if ([instance respondsToSelector:@selector(optionaldMethod1)]) {
    [instance optionaldMethod1];
  }
}
