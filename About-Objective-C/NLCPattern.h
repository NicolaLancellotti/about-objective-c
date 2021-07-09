#ifndef NLCPattern_h
#define NLCPattern_h

#include <stdio.h>

#include <os/availability.h>
void myFunctionForiOS11OrNewer(int i) API_AVAILABLE(ios(11.0), macos(10.13));

class API_AVAILABLE(ios(11.0), macos(10.13)) MyClassForiOS11OrNewer;

#endif /* NLCPattern_h */
