#import "NLManageOwnership.h"

@implementation NLManageOwnership

@end

void NLManageOwnershipFunctions(void)
{
  NSString * strongVariable1; // strong by default
  
  NSString * __strong strongVariable2;
  
  /*
   A weak reference is a reference that does not keep a strong hold on the
   instance it refers to, and so does not stop ARC from disposing of the
   referenced instance. This behavior prevents the reference from becoming
   part of a strong reference cycle.
   
   available iOS > 4 macOS > 10.6
   There are a few classes in Cocoa and Cocoa Touch that don’t yet support
   weak references.
   */
  NSString * __weak weakVariable;
  
  /*
   An unsafe reference is similar to a weak reference in that it doesn’t keep
   its related object alive, but it won’t be set to nil if the destination
   object is deallocated. This means that you’ll be left with a dangling
   pointer to the memory originally occupied by the now deallocated object,
   hence the term “unsafe.” Sending a message to a dangling pointer will
   result in a crash.
   */
  NSString * __unsafe_unretained unsafeUnretainedVariable;
  
  
  NSString * __autoreleasing autoreleasingVariable;
  
  assert(strongVariable1 == nil);
  assert(strongVariable2 == nil);
  assert(weakVariable == nil);
  assert(unsafeUnretainedVariable == nil);
  assert(autoreleasingVariable == nil);
}
