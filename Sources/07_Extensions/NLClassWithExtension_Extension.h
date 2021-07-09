#import "NLClassWithExtension.h"

NS_ASSUME_NONNULL_BEGIN

/*
 Because no name is given in the parentheses, class extensions are often
 referred to as anonymous categories.
 A class extension bears some similarity to a category, but it can only be added
 to a class for which you have the source code at compile time
 (the class is compiled at the same time as the class extension).
 
 Unlike regular categories, a class extension can add its own properties and
 instance variables to a class.
 
 The methods declared by a class extension are implemented in the
 @implementation block for the original class
 
 Class extensions are often used to extend the public interface with additional
 private methods or properties for use within the implementation of the class
 itself. It’s common, for example, to define a property as readonly in the
 interface, but as readwrite in a class extension declared above the
 implementation, in order that the internal methods of the class can change the
 property value directly
 If you intend to make "private" methods or properties available to other
 classes, such as related classes within a framework, you can declare the class
 extension in a separate header file and import it in the source files that need
 it. It’s not uncommon to have two header files for a class, for example, such
 as XYZPerson.h and XYZPersonPrivate.h. When you release the framework, you only
 release the public XYZPerson.h header file.
 */
@interface NLClassWithExtension ()

@property NSString * property;

- (void)method;

@end

NS_ASSUME_NONNULL_END
