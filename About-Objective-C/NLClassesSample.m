#import "NLClass.h"
#import "NLInterface.h"

void NLClassesSample()
{
#pragma mark - Init
  /*
   The first step in creating an object is to make sure enough memory is
   allocated not only for the properties defined by an object’s class, but also
   the properties defined on each of the superclasses in its inheritance chain.
   The alloc method has one other important task, which is to clear out the
   memory allocated for the object’s properties by setting them to zero.
   
   Class Factory Methods Are an Alternative to Allocation and Initialization
   
   It’s also possible to create an instance of a class using the new class
   method. This method is provided by NSObject and doesn’t need to be
   overridden in your own subclasses.
   */
  
  {
    NLFinalClass *instance;
    instance = [[NLFinalClass alloc] init];
    instance = [NLFinalClass new];
  }
  
  NLClass *instance = [[NLClass alloc] initWithInt:0];
  
#pragma mark - Send and Receive Messages
  
  NSString* result = [instance someMethodWithFirstValue:@"" secondValue:@""];
  NSLog(@"%@", result);
  
  //  Objects Can Send Messages to Themselves
  //  [self foo]
  
  //  Objects Can Call Methods Implemented by Their Superclasses
  //  [super foo]
  
#pragma mark - Accessor Methods
  
  // Set
  instance.readwriteProperty1 = @"a string";
  [instance setReadwriteProperty1:@"a string"];
  
  instance.finished = YES;
  [instance setFinished:YES];
  
  // Get
  NSString *aString = instance.readwriteProperty1;
  aString = [instance readwriteProperty1];
  
  BOOL finished = instance.isFinished;
  finished = [instance isFinished];
  finished = instance.finished;
  
#pragma mark - Method with Variable Arguments
  
  NSInteger sum = [NLClass sum:3, 1, 2, 3];
  NSLog(@"%ld",sum); // print 6
}
