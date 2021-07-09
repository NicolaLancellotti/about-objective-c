#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NLPerson : NSObject

@property NSString* name;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithName:(NSString*)name NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
