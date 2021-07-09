#import <Foundation/Foundation.h>
#import "NLProtocols.h"

NS_ASSUME_NONNULL_BEGIN

/*
 Conforming to Protocols
 There’s no need to redeclare the protocol methods in the class interface
 the adoption of the protocol is sufficient.
 
 The compiler does not automatically synthesize properties declared in adopted protocols.
 */
@interface NLClassConformToProtocols : NSObject <NLSomeProtocol1, NLSomeProtocol2>

@property (weak) id <NLSomeProtocol4, NLSomeProtocol2> delegate;

@end

NS_ASSUME_NONNULL_END
