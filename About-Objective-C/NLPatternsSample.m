#import "NLInterface.h"
#import "NLPatterns.h"

void NLPatternsSample()
{
  NSError *error = nil;
  BOOL success = [NLPatterns makeSomethingWithName:@"Nicola" error:&error];
  if (!success) {
    NSLog(@"Error: %@", error.domain);
  }
  
  NSObject *object = [NLPatterns makeSomething2WithName:@"Nicola" error:&error];
  if (!object) {
    NSLog(@"Error: %@", error.domain);
  }
}
