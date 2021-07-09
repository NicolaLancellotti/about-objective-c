#import <Foundation/Foundation.h>

#pragma mark - Forward Declarations

@class NLClass;
@protocol NLProtocols;

void test_miscellaneous()
{
#pragma mark - Boolenan
  
  BOOL flag = YES;
  flag = NO;
  
#pragma mark - Integers
  
  NSInteger integer = 1;
  NSUInteger unsignedInteger = 1;
  
#pragma mark - Literal Syntax
  
  NSString *string = @"Hello World!";
  
  NSNumber *integerNumber = @42;
  NSNumber *unsignedNumber = @42u;
  NSNumber *longNumber = @42l;
  
  NSNumber *boolNumber = @YES;
  
  NSNumber *floatNumber = @3.14f;
  NSNumber *doubleNumber = @3.1415926535;
  
  NSNumber *charNumber = @'T';
  
  NSArray *array1 = @[
    string,
    integerNumber,
    unsignedNumber,
    longNumber,
    boolNumber,
    floatNumber,
    doubleNumber,
    charNumber
  ];
  
  NSDictionary *dictionary = @{
    @"key0" : @"object0",
    @"magicNumber" : @42
  };
  
#pragma mark - Fast Enumeration
  
  for (id eachObject in array1) {
    
  }
  
#pragma mark - Dynamic Language
  /*
   The id type defines a generic object pointer.
   It’s possible to use id when declaring a variable, but you lose compile-time
   information about the object.
   */
  id object = string;
  NSString *uppercaseString = [object uppercaseString];
  
#pragma mark - __kindof
  /*
   __kindof types implicit convert to superclasses and subclasses
   */
  {
    NSMutableString *string1 = [[NSMutableString alloc] initWithString:@"Hello"];
    NSArray<__kindof NSString *> *array = @[string1];
    NSMutableString *string2 = array[0];
  }
}
