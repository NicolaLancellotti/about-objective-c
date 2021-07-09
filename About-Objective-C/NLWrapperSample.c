#include "NLPersonRef.h"
#include <assert.h>
#include <string.h>
#include <stdlib.h>

void NLWrapperSample(void)
{
  NLPersonRef person = NLPersonCreate("Name1");
  
  {
    char* name = NLPersonGetName(person);
    assert(!strcmp(name, "Name1"));
    NLStringDelete(name);
  }
  
  NLPersonSetName(person, "Name2");
  
  {
    char* name = NLPersonGetName(person);
    assert(!strcmp(name, "Name2"));
    NLStringDelete(name);
  }
  
  NLPersonDelete(person);
}
