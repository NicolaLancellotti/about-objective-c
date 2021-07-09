#import <Foundation/Foundation.h>

/*
 Audited regions make default assumptions about some pointers:
 Single-level pointers are assumed to be nonnull
 NSError** parameters are assumed to be nullable for both levels
 */
NS_ASSUME_NONNULL_BEGIN

void funcWithImplicitlyNonNullArgument(NSString *aString);
void funcWith_NonnullArgument(NSString * _Nonnull aString);
void funcWith_NullableArgument(NSString * _Nullable aString);
void funcWith_Null_unspecifiedArgument(NSString * _Null_unspecified aString);

NS_ASSUME_NONNULL_END
