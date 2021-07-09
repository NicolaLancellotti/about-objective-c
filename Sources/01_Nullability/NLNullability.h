#import <Foundation/Foundation.h>

/*
 Audited regions make default assumptions about pointers:
 - Single-level pointers are assumed to be nonnull
 - NSError** parameters are assumed to be nullable for both levels
 */
NS_ASSUME_NONNULL_BEGIN

void nullability(NSString * implicitNonNullString,
                 NSString * _Nonnull nonNullString,
                 NSString * _Nullable nullableString,
                 NSString * _Null_unspecified nullUnspecifiedString);

NS_ASSUME_NONNULL_END
