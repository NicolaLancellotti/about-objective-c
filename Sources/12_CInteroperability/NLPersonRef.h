#ifndef NLPersonRef_h
#define NLPersonRef_h

typedef struct NLOpaquePerson* NLPersonRef;

NLPersonRef NLPersonCreate(const char* name);
void NLPersonDelete(NLPersonRef personRef);
char* NLPersonGetName(NLPersonRef personRef);
void NLPersonSetName(NLPersonRef personRef, const char* name);

void NLStringDelete(char* string);

#endif
