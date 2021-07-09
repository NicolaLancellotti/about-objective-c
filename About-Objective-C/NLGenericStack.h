#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NLGenericStack<T> : NSObject

- (void)push:(T)object;
- (nullable T)pop;

@end

NS_ASSUME_NONNULL_END
