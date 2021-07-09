#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// In Objective-C, a class is itself an object with an opaque type called Class.
@interface NLClass : NSObject

// The synthesized instance variable has the same name as the property,
// but with an underscore prefix.

#pragma mark - ReadWrite - Readonly Properties

@property NSString * readwriteProperty1;             // readwrite by default
@property (readwrite) NSString * readwriteProperty2;
@property (readonly) NSString * readonlyProperty;

#pragma mark - Atomic - Nonatomic Properties

@property NSString * atomicProperty1;                // atomic by default
@property (atomic) NSString * atomicProperty2;
@property (nonatomic) NSString * nonatomicProperty;

#pragma mark - Properties with different name for an accessor method

@property (getter=isFinished) BOOL finished;

#pragma mark - Class Properties
//  Class Properties are never synthesized
@property(class, readonly) NSInteger classProperty;

#pragma mark - Nullability

@property NSString * nonnullProperty1; // nonnull by default
@property (nonnull) NSString * nonnullProperty2;
@property (nullable) NSString * nullableProperty;
@property (null_unspecified) NSString * null_unspecifiedProperty;

#pragma mark - Inits

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithString:(NSString*)aString NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithInt:(int)anInt; // convenience initializer

#pragma mark - Instance Methods

- (void)doSomething;

- (nullable NSString*)someMethodWithFirstValue:(NSString*)value1
                                   secondValue:(NSString*)value2;

#pragma mark - Class Methods

+ (void)doSomething;

#pragma mark - Method with Variable Arguments

+ (NSInteger)sum:(NSInteger)num_args, ...;

@end

#pragma mark - Final Classes

__attribute__((objc_subclassing_restricted))
@interface NLFinalClass : NSObject
@end

// Error
//@interface NLSubClass : NLFinalClass
//@end

NS_ASSUME_NONNULL_END
