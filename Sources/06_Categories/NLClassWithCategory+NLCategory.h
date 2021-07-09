#import "NLClassWithCategory.h"

NS_ASSUME_NONNULL_BEGIN

/*
 Categories Add Methods to Existing Classes
 
 Properties
 It’s valid syntax to include a property declaration in a category interface,
 but it’s not possible to declare an additional instance variable in a category.
 This means the compiler won’t synthesize any instance variable, nor will it
 synthesize any property accessor methods.
 You can write your own accessor methods in the category implementation,
 but you won’t be able to keep track of a value for that property unless it’s
 already stored by the original class.
 */
@interface NLClassWithCategory (NLCategory)

/*
 If the name of a method declared in a category is the same as a method in the
 original class, or a method in another category on the same class (or even a
 superclass), the behavior is undefined as to which method implementation is
 used at runtime.
 In order to avoid undefined behavior, it’s best practice to add a prefix to
 method names in categories on framework classes, just like you should add a
 prefix to the names of your own classes. You might choose to use the same three
 letters you use for your class prefixes, but lowercase to follow the usual
 convention for method names, then an underscore, before the rest of the method
 name.
 */
- (void)nl_method;

@end

NS_ASSUME_NONNULL_END
