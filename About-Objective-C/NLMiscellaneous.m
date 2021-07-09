#import "NLInterface.h"

#pragma mark - Forward Declarations

@class NLClass;
@protocol NLProtocols;

void NLMiscellaneous()
{
#pragma mark - Boolenan
  
  BOOL flag = YES;
  flag = NO;
  
#pragma mark - Integers
  
  /*
   These types, like NSInteger and NSUInteger, are defined differently
   depending on the target architecture. When building for a 32-bit environment
   (such as for iOS), they are 32-bit signed and unsigned integers respectively;
   when building for a 64-bit environment (such as for the modern OS X runtime)
   they are 64-bit signed and unsigned integers respectively.
   */
  NSInteger integer = 1;
  NSUInteger uInteger = 1;
  NSLog(@"%ld", (long)integer);
  NSLog(@"%lu", (unsigned long)uInteger);
  
#pragma mark - Literal Syntax
  
  NSString *string = @"Hello World!";
  
  NSNumber *integerNumber = @42;
  NSNumber *unsignedNumber = @42u;
  NSNumber *longNumber = @42l;
  
  NSNumber *boolNumber = @YES;
  
  NSNumber *floatNumber = @3.14f;
  NSNumber *doubleNumber = @3.1415926535;
  
  NSNumber *charNumber = @'T';
  
  NSArray *someArray = @[string,
                         integerNumber,
                         unsignedNumber,
                         longNumber,
                         boolNumber,
                         floatNumber,
                         doubleNumber,
                         charNumber];
  
  NSDictionary *dictionary = @{@"key0" : @"object0",
                               @"magicNumber" : @42};
  NSLog(@"%@", dictionary);
  
#pragma mark - Fast Enumeration
  
  for (id eachObject in someArray) {
    NSLog(@"Object: %@", eachObject);
  }
  
#pragma mark - Dynamic Language
  /*
   The id type defines a generic object pointer.
   It’s possible to use id when declaring a variable, but you lose compile-time
   information about the object.
   */
  id object = string;
  NSString *uppercaseString = [object uppercaseString];
  NSLog(@"%@", uppercaseString);
  
#pragma mark - __kindof
  /*
   __kindof types implicit convert to superclasses and subclasses
   */
  NSMutableString *string1 = [[NSMutableString alloc] initWithString:@"Hello"];
  NSArray<__kindof NSString *> *array = @[string1];
  NSMutableString *string2 = array[0];
  NSLog(@"%@", string2);
}
