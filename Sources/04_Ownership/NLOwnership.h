#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NLOwnership : NSObject

@property double assignProperty1;                   // assign by default
@property (assign) double assignProperty2;

@property NSString * strongProperty1;               // strong by default
@property (strong) NSString * strongProperty2;

@property (weak) NSString * weakProperty;
@property (unsafe_unretained) NSString * unsafeProperty;

/*
 Any object that you wish to set for a copy property must support NSCopying,
 which means that it should conform to the NSCopying protocol.
 
 If you need to set a copy property’s instance variable directly, for example
 in an initializer method, don’t forget to set a copy of the original object
 */
@property (copy) NSString *copiedProperty;

@end

NS_ASSUME_NONNULL_END
