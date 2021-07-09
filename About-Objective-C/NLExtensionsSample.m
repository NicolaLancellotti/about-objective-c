#import "NLInterface.h"
#import "NLClassWithExtension_Extension.h"

void NLExtensionsSample()
{
  NLClassWithExtension *instance = [NLClassWithExtension new];
  [instance doSomething];
  instance.property = @"Hello, World!";
}
