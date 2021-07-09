#import "NLInterface.h"
#import "NLGenericStack.h"

void NLGenericsSample() {
  NLGenericStack<NSString*> *stringStack = [NLGenericStack new];
  [stringStack push:@"First string"];
  [stringStack push:@"Second string"];
  NSLog(@"%@, %@", [stringStack pop], [stringStack pop]);
  // print Second string, First string
}
