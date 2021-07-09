#import "NLInterface.h"
#import "NLClassConformToProtocols.h"

void NLProtocolsSample()
{
  NLClassConformToProtocols *instance = [NLClassConformToProtocols new];
  
  [instance requiredMethod1];
  [instance.delegate requiredMethod5];
  
  // Check that Optional Methods Are Implemented at Runtime
  if ([instance respondsToSelector:@selector(optionaldMethod1)]) {
    [instance optionaldMethod1];
  }
}
