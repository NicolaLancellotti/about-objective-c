#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enumerations

typedef NS_ENUM(NSUInteger, NLEnumeration) {
  NLEnumeration0,
  NLEnumeration1
};

typedef NS_OPTIONS(NSUInteger, NLOption) {
  NLOptionNone = 0,
  NLOption0    = 1 << 0,
  NLOption1    = 1 << 1,
  NLOption2    = 1 << 2
};

#pragma mark - Constants

// Constants imported from a type declaration marked with the
// NS_TYPED_EXTENSIBLE_ENUM macro can be extended in Swift code
// to add new values.
typedef NSString *NLExtensibleConstant NS_TYPED_EXTENSIBLE_ENUM;
extern NLExtensibleConstant const NLExtensibleConstantA;
extern NLExtensibleConstant const NLExtensibleConstantB;

// Constants imported from a type declaration marked with the NS_TYPED_ENUM
// macro cannot be extended in Swift code to add new values.
typedef NSString *NLConstant NS_TYPED_ENUM;
extern NLConstant const NLConstantA;
extern NLConstant const NLConstantB;

NS_ASSUME_NONNULL_END
