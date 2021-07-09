#import "NLInterface.h"

void run()
{
  test_nullability();
  test_enumerations();
  test_classes();
  test_ownership();
  test_protocols();
  test_categories();
  test_extensions();
  test_generics();
  test_blocks();
  test_blocks_in_c();
  test_patterns();
  test_miscellaneous();
  test_c_interoperability();
}

int main(int argc, const char * argv[])
{
  @autoreleasepool {
    run();
  }
  return 0;
}
