#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Errors
static NSString *const MyErrorDomain = @"com.example.MyErrorDomain";
typedef NS_ERROR_ENUM(MyErrorDomain, MyError) {
  MyErrorSpecificError1 = 0,
  MyErrorSpecificError2 = 1
};

@interface NLPatterns : NSObject

#pragma mark - Singleton

@property (class, readonly, nonatomic) NLPatterns *sharedInstance;

#pragma mark - Lazy Initialization

@property (nonatomic) NSString* lazyObject;

#pragma mark - Errors

+ (BOOL)makeSomethingWithName:(NSString*)name
error:(NSError**)error;

+ (nullable NSString*)makeSomething2WithName:(NSString*)name
error:(NSError**)error;
#pragma mark - Availability
- (void) newMethod API_AVAILABLE(ios(11), macosx(10.13));

@end

NS_ASSUME_NONNULL_END
