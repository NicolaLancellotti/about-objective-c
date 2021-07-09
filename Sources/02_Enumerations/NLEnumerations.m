#import "NLEnumerations.h"

NLExtensibleConstant const NLExtensibleConstantA = @"NLExtensibleConstantA";
NLExtensibleConstant const NLExtensibleConstantB = @"NLExtensibleConstantB";

NLConstant const NLConstantA = @"NLConstantA";
NLConstant const NLConstantB = @"NLConstantB";

void test_enumerations()
{
  NLEnumeration enumeration = NLEnumeration0;
  NLOption option = NLOption1 & NLOption2;
  NLExtensibleConstant extensibleConstant = NLExtensibleConstantB;
  NLConstant constant = NLConstantA;
}
