#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, NLDay) {
  NLDaySunday,
  NLDayMonday,
  NLDayTuesday,
  NLDayWednesday,
  NLDayThursday,
  NLDayFriday,
  NLDaySaturday
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
typedef NSString *NLExtensibleEnum NS_TYPED_EXTENSIBLE_ENUM;
extern NLExtensibleEnum const NLExtensibleEnumA;
extern NLExtensibleEnum const NLExtensibleEnumB;

// Constants imported from a type declaration marked with the
// NS_TYPED_ENUM macro cannot be extended in Swift code
// to add new values.
typedef NSString *NEnum NS_TYPED_ENUM;
extern NEnum const NEnumA;
extern NEnum const NEnumB;

#pragma mark - Errors
NSString *const NLErrorDomain;
typedef NS_ERROR_ENUM(NLErrorDomain, NLError) {
  NLErrorA,
  NLErrorB,
};
