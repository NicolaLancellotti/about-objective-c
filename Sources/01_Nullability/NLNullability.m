#import "NLNullability.h"

void nullability(NSString * implicitNonNullString,
                 NSString * _Nonnull nonNullString,
                 NSString * _Nullable nullableString,
                 NSString * _Null_unspecified nullUnspecifiedString)
{
  
}

void test_nullability()
{
  nullability(@"", @"", nil, nil);
}
