#ifndef NLPerson_h
#define NLPerson_h

#include <stdio.h>

typedef struct NLOpaquePerson* NLPersonRef;

NLPersonRef NLPersonCreate(const char* name);
void NLPersonDelete(NLPersonRef personRef);
char* NLPersonGetName(NLPersonRef personRef);
void NLPersonSetName(NLPersonRef personRef, const char* name);

void NLStringDelete(char* string);
#endif
