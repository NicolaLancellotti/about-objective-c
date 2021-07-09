#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NLSomeProtocol1

#pragma mark - Required methods and properties

@required
- (void)requiredMethod1;

#pragma mark - Optional methods and properties
/*
 The @optional directive applies to any methods that follow it,
 either until the end of the protocol definition, or until another directive
 is encountered, such as @required.
 
 Check that Optional Methods Are Implemented at Runtime
 */
@optional
- (void)optionaldMethod1;

#pragma mark - Other Required methods and properties

@required
- (void)requiredMethod2;

@end


@protocol NLSomeProtocol2

- (void)requiredMethod3;

@end

//Protocols can inherit from Other Protocols
@protocol NLSomeProtocol3 <NLSomeProtocol1, NLSomeProtocol2>

- (void)requiredMethod4;

@end

@protocol NLSomeProtocol4

- (void)requiredMethod5;

@end

NS_ASSUME_NONNULL_END
