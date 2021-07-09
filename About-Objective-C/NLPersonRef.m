#import <Foundation/Foundation.h>
#include "NLPersonRef.h"
#import "NLPerson.h"

static inline NLPersonRef wrap(NLPerson *person) {
  return (NLPersonRef)CFBridgingRetain(person);
}

static inline NLPerson* unwrap(NLPersonRef personRef) {
  NLPerson* person = (__bridge NLPerson *)(personRef);
  return person;
}

NLPersonRef NLPersonCreate(const char* name)
{
  NLPerson* person = [NLPerson new];
  return wrap(person);
}

void NLPersonDelete(NLPersonRef personRef)
{
  CFBridgingRelease(personRef);
}

char* NLPersonGetName(NLPersonRef personRef)
{
  NLPerson *person = unwrap(personRef);
  char* name = strdup([person.name UTF8String]);
  return name;
}

void NLPersonSetName(NLPersonRef personRef, const char* name)
{
  NLPerson *person = unwrap(personRef);
  person.name = [NSString stringWithCString: name
                                   encoding: NSASCIIStringEncoding];
}

void NLStringDelete(char* string) {
  free(string);
}
