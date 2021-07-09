#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Errors

static NSString *const NLErrorDomain = @"com.example.NLErrorDomain";

typedef NS_ERROR_ENUM(NLErrorDomain, NLError) {
  NLErrorA,
  NLErrorB,
};

@interface NLPatterns : NSObject

#pragma mark - Singleton

@property (class, readonly, nonatomic) NLPatterns *sharedInstance;

#pragma mark - Lazy Initialization

@property (nonatomic) NSString* lazyObject;

#pragma mark - Errors

+ (BOOL)shouldRaise:(BOOL)flag error:(NSError* _Nullable *)error;
+ (BOOL)shouldRaise2:(BOOL)flag error:(NSError* _Nullable __strong *)error;

#pragma mark - Availability

- (void)methodWithAvailability API_AVAILABLE(ios(11), macosx(10.13));

@end

NS_ASSUME_NONNULL_END
