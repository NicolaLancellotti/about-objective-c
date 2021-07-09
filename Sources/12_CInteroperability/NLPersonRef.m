#import <Foundation/Foundation.h>
#import "NLPersonRef.h"
#import "NLPerson.h"

static inline NLPersonRef wrap(NLPerson *person)
{
  return (NLPersonRef)CFBridgingRetain(person);
}

static inline NLPerson* unwrap(NLPersonRef personRef)
{
  return (__bridge NLPerson *)(personRef);
}

NLPersonRef NLPersonCreate(const char* name)
{
  NSString *nsString = [NSString stringWithCString: name
                                          encoding: NSASCIIStringEncoding];
  NLPerson* person = [[NLPerson alloc] initWithName: nsString];
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

void NLStringDelete(char* string)
{
  free(string);
}

void test_c_interoperability()
{
  NLPersonRef person = NLPersonCreate("Name");
  
  {
    char* name = NLPersonGetName(person);
    assert(!strcmp(name, "Name"));
    NLStringDelete(name);
  }
  
  NLPersonSetName(person, "NewName");
  {
    char* name = NLPersonGetName(person);
    assert(!strcmp(name, "NewName"));
    NLStringDelete(name);
  }
  
  NLPersonDelete(person);
}
