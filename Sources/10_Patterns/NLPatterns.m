#import "NLPatterns.h"
#include "NLPatternsInC.h"

@implementation NLPatterns

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
  static id _sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedInstance = [[self alloc] init];
  });
  return _sharedInstance;
}

#pragma mark - Lazy Initialization

- (NSString*)lazyObject
{
  if (!_lazyObject) {
    _lazyObject = @"Default Value";
  }
  return _lazyObject;
}

#pragma mark - Errors

+ (BOOL)shouldRaise:(BOOL)flag
              error:(NSError* _Nullable /* implicit __autoreleasing */ *)error
{
  if (!flag) {
    return YES; // Success
  }
  
  NSError *strongError = nil;
  @autoreleasepool {
    if (error) {
      strongError = [NSError errorWithDomain:NLErrorDomain
                                        code:NLErrorB
                                    userInfo:nil];
    }
  }
  *error = strongError;
  return NO; // Failure
}

+ (BOOL)shouldRaise2:(BOOL)flag
               error:(NSError* _Nullable __strong *)error
{
  if (!flag) {
    return YES; // Success
  }
  
  @autoreleasepool {
    if (error) {
      *error = [NSError errorWithDomain:NLErrorDomain
                                   code:NLErrorB
                               userInfo:nil];
    }
  }
  return NO; // Failure
}


#pragma mark - Availability

- (void)methodWithAvailability
{
  
}

@end

void test_patterns()
{
  
  {
    // __autoreleasing NSError
    NSError *error = nil;
    BOOL success = [NLPatterns shouldRaise:NO error:&error];
    if (!success) {
      NSLog(@"Error domain: %@\nError code: %ld", error.domain, (long)error.code);
    }
  }
  {
    // __strong NSError
    NSError *error = nil;
    BOOL success = [NLPatterns shouldRaise2:NO error:&error];
    if (!success) {
      NSLog(@"Error domain: %@\nError code: %ld", error.domain, (long)error.code);
    }
  }
  {
    // Availability
    if (@available(macos 10.13, *)) {
      
    } else {
      
    }
  }
}
