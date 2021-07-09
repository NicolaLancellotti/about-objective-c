#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NLProtocol1

#pragma mark - Required Methods and Properties

@required
- (void)requiredMethod1;

#pragma mark - Optional Methods and Properties
/*
 The @optional directive applies to any methods that follow it, either until the
 end of the protocol definition, or until another directive
 is encountered, such as @required.
 
 Check that optional methods are implemented at runtime
 */
@optional
- (void)optionaldMethod1;

#pragma mark - Other Required Methods and Properties

@required
- (void)requiredMethod2;

@end

@protocol NLProtocol2

- (void)requiredMethod3;

@end

// Protocols can inherit from other protocols
@protocol NLProtocol3 <NLProtocol1, NLProtocol2>

- (void)requiredMethod4;

@end

NS_ASSUME_NONNULL_END
