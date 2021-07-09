#import "NLNullability.h"

void funcWithImplicitlyNonNullArgument(NSString *aString)
{
  
}

void funcWith_NonnullArgument(NSString * _Nonnull aString)
{
  
}

void funcWith_NullableArgument(NSString * _Nullable aString)
{
  
}

void funcWith_Null_unspecifiedArgument(NSString * _Null_unspecified aString)
{
  
}
