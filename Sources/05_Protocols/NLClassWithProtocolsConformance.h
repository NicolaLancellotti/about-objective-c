#import <Foundation/Foundation.h>
#import "NLProtocols.h"

NS_ASSUME_NONNULL_BEGIN

/*
 Conforming to Protocols
 The compiler does not automatically synthesize properties declared in adopted protocols.
 */
@interface NLClassWithProtocolsConformance : NSObject <NLProtocol1, NLProtocol2>

@property (weak) id <NLProtocol1, NLProtocol2> delegate;

@end

NS_ASSUME_NONNULL_END
