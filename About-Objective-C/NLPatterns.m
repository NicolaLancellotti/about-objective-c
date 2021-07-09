#import "NLPatterns.h"

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
    _lazyObject = @"Hello, World!";
  }
  return _lazyObject;
}

#pragma mark - Errors

+ (BOOL)makeSomethingWithName:(NSString*)name
                        error:(NSError**)error
{
  // if an error occurred
  if (error) {
    *error = [NSError errorWithDomain:MyErrorDomain
                                 code:MyErrorSpecificError1
                             userInfo:nil];
  }
  return NO;
  
  // else
  return YES;
}

+ (nullable NSString*)makeSomething2WithName:(NSString*)name
                                       error:(NSError**)error
{
  // if an error occurred
  if (error) {
    *error = [NSError errorWithDomain:NSURLErrorDomain
                                 code:NSURLErrorCannotOpenFile
                             userInfo:nil];
  }
  return nil;
  
  // else
  return @"Hello";
}

// NSError is autoreleasing

- (BOOL)validateDictionary1:(NSDictionary *)dict  error:(NSError **)error {
  __block BOOL isValid = YES;
  __block NSError *strongError = nil;
  [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    if ([key isKindOfClass:[NSString class]]) {
      return;
    }
    *stop = YES; isValid = NO;
    strongError = [NSError errorWithDomain:NSURLErrorDomain
                                      code:NSURLErrorCannotOpenFile
                                  userInfo:nil];
  }];
  if (error)  {
    *error = strongError;
  }
  return isValid;
}

- (BOOL)validateDictionary2:(NSDictionary *)dict  error:(NSError *__strong*)error {
  __block BOOL isValid = YES;
  
  [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    if ([key isKindOfClass:[NSString class]]) {
      return;
    }
    *stop = YES; isValid = NO;
    if (error)  {
      *error = [NSError errorWithDomain:NSURLErrorDomain
                                   code:NSURLErrorCannotOpenFile
                               userInfo:nil];
    }
  }];
  
  return isValid;
}
#pragma mark - Availability

- (void)availabilitySample
{
  if (@available(iOS 11, *)) {
    // Use iOS 11 APIs.
  } else {
    // Alternative code for earlier versions of iOS.
  }
}

- (void)newMethod API_AVAILABLE(ios(11), macosx(10.13))
{
  
}

@end
