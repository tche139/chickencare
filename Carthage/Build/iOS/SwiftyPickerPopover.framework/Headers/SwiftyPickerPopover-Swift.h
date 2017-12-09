// Generated by Apple Swift version 3.1 (swiftlang-802.0.53 clang-802.0.42)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if defined(__has_attribute) && __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
@import CoreGraphics;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSBundle;
@class NSCoder;

/// AbstractPopover’s view controller
SWIFT_CLASS("_TtC19SwiftyPickerPopover35AbstractPickerPopoverViewController")
@interface AbstractPickerPopoverViewController : UIViewController
- (void)viewWillAppear:(BOOL)animated;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIPresentationController;
@class UITraitCollection;

@interface AbstractPickerPopoverViewController (SWIFT_EXTENSION(SwiftyPickerPopover)) <UIPopoverPresentationControllerDelegate>
/// Popover appears on iPhone
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController * _Nonnull)controller traitCollection:(UITraitCollection * _Nonnull)traitCollection SWIFT_WARN_UNUSED_RESULT;
@end

@class UIColor;
@class UIView;
@class UINavigationController;

/// The original popover for all
SWIFT_CLASS("_TtC19SwiftyPickerPopover15AbstractPopover")
@interface AbstractPopover : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
/// Set permitted arrow directions
/// \param permittedArrowDirections Permitted arrow directions
///
///
/// returns:
/// Self
- (nonnull instancetype)setPermittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections SWIFT_WARN_UNUSED_RESULT;
/// Set arrow color
/// \param color Arrow color. Specify the color of viewController.backgroundColor
///
///
/// returns:
/// Self
- (nonnull instancetype)setArrowColor:(UIColor * _Nonnull)color SWIFT_WARN_UNUSED_RESULT;
/// Display the popover.
/// <ul>
///   <li>
///     Parameter
///     <ul>
///       <li>
///         originView: View to be the origin point at where the popover appears.
///       </li>
///       <li>
///         baseViewWhenOriginViewHasNoSuperview: SourceView of popoverPresentationController. Omissible. This view will be used instead of originView.superView when it is nil.
///       </li>
///       <li>
///         baseViewController: Base viewController
///       </li>
///       <li>
///         completion: Action to be performed after the popover appeared. Omissible.
///       </li>
///     </ul>
///   </li>
/// </ul>
- (void)appearWithOriginView:(UIView * _Nonnull)originView baseViewWhenOriginViewHasNoSuperview:(UIView * _Nullable)baseViewWhenOriginViewHasNoSuperview baseViewController:(UIViewController * _Nonnull)baseViewController completion:(void (^ _Nullable)(void))completion;
/// Configure contentViewController of popover
/// \param navigationController Source navigationController.
///
///
/// returns:
/// ContentViewController.
- (AbstractPickerPopoverViewController * _Nullable)configureContentViewControllerWithNavigationController:(UINavigationController * _Nonnull)navigationController SWIFT_WARN_UNUSED_RESULT;
/// Close the popover
/// \param completion Action to be performed after the popover disappeared. Omissible.
///
- (void)disappearWithCompletion:(void (^ _Nullable)(void))completion;
/// Close the popover automatically after the specified seconds.
/// \param seconds Seconds to delay closing
///
/// \param completion Action to be performed after the popover disappeared. Omissible.
///
- (void)disappearAutomaticallyAfter:(double)seconds completion:(void (^ _Nullable)(void))completion;
/// Reload the popover with the latest properties.
- (void)reload;
/// Configure navigationController
/// \param storyboardName Storyboard name
///
/// \param originView View to be the origin point at where the popover appears.
///
/// \param baseViewWhenOriginViewHasNoSuperview SourceView of popoverPresentationController. Omissible.
///
/// \param baseViewController Base viewController
///
/// \param permittedArrowDirections The default value is ‘.any’. Omissible.
///
///
/// returns:
/// The configured navigationController
- (UINavigationController * _Nullable)configureNavigationControllerWithStoryboardName:(NSString * _Nonnull)storyboardName originView:(UIView * _Nonnull)originView baseViewWhenOriginViewHasNoSuperview:(UIView * _Nullable)baseViewWhenOriginViewHasNoSuperview baseViewController:(UIViewController * _Nonnull)baseViewController permittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections SWIFT_WARN_UNUSED_RESULT;
@end


/// ColumnStringPickerPopover has an UIPickerView of multiple columns.
SWIFT_CLASS("_TtC19SwiftyPickerPopover25ColumnStringPickerPopover")
@interface ColumnStringPickerPopover : AbstractPopover
/// Initialize a Popover with the following arguments.
/// \param title Title for navigation bar.
///
/// \param choices Options for picker.
///
/// \param selectedRow Selected rows of picker.
///
/// \param columnPercent Rate of each column of picker
///
- (nonnull instancetype)initWithTitle:(NSString * _Nullable)title choices:(NSArray<NSArray<NSString *> *> * _Nonnull)choices selectedRows:(NSArray<NSNumber *> * _Nonnull)selectedRows columnPercents:(NSArray<NSNumber *> * _Nonnull)columnPercents OBJC_DESIGNATED_INITIALIZER;
/// Set selected rows
/// \param row Selected rows of picker
///
///
/// returns:
/// Self
- (nonnull instancetype)setSelectedRows:(NSArray<NSNumber *> * _Nonnull)rows SWIFT_WARN_UNUSED_RESULT;
/// Set displayStringFor closures
/// \param displayStringFor Rules for converting choice values to display strings.
///
///
/// returns:
/// Self
- (nonnull instancetype)setDisplayStringFor:(NSString * _Nullable (^ _Nullable)(NSString * _Nullable))displayStringFor SWIFT_WARN_UNUSED_RESULT;
/// Set done button properties
/// \param title Title for the bar button item
///
/// \param color Button tint color. Omissible. If this is nil or not specified, then the button tintColor inherits appear()’s baseViewController.view.tintColor.
///
/// \param action Action to be performed before the popover disappeared.
///
///
/// returns:
/// Self
- (nonnull instancetype)setDoneButtonWithTitle:(NSString * _Nullable)title color:(UIColor * _Nullable)color action:(void (^ _Nullable)(ColumnStringPickerPopover * _Nonnull, NSArray<NSNumber *> * _Nonnull, NSArray<NSString *> * _Nonnull))action SWIFT_WARN_UNUSED_RESULT;
/// Set cancel button properties.
/// \param title Title for the bar button item
///
/// \param color Button tint color. Omissible. If this is nil or not specified, then the button tintColor inherits appear()’s baseViewController.view.tintColor.
///
/// \param action Action to be performed before the popover disappeared.
///
///
/// returns:
/// Self
- (nonnull instancetype)setCancelButtonWithTitle:(NSString * _Nullable)title color:(UIColor * _Nullable)color action:(void (^ _Nullable)(ColumnStringPickerPopover * _Nonnull, NSArray<NSNumber *> * _Nonnull, NSArray<NSString *> * _Nonnull))action SWIFT_WARN_UNUSED_RESULT;
/// Set font size
/// \param fontSize Font size on picker
///
///
/// returns:
/// Self
- (nonnull instancetype)setFontSize:(CGFloat)fontSize SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class UIPickerView;

@interface ColumnStringPickerPopover (SWIFT_EXTENSION(SwiftyPickerPopover)) <UIPickerViewDelegate>
- (NSString * _Nullable)pickerView:(UIPickerView * _Nonnull)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
- (UIView * _Nonnull)pickerView:(UIPickerView * _Nonnull)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView * _Nullable)view SWIFT_WARN_UNUSED_RESULT;
- (void)pickerView:(UIPickerView * _Nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
@end


@interface ColumnStringPickerPopover (SWIFT_EXTENSION(SwiftyPickerPopover)) <UIPickerViewDataSource>
/// UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView * _Nonnull)pickerView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)pickerView:(UIPickerView * _Nonnull)pickerView numberOfRowsInComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)pickerView:(UIPickerView * _Nonnull)pickerView widthForComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
@end

@class UIPopoverPresentationController;

SWIFT_CLASS("_TtC19SwiftyPickerPopover39ColumnStringPickerPopoverViewController")
@interface ColumnStringPickerPopoverViewController : AbstractPickerPopoverViewController
- (void)viewDidLoad;
/// Action to be executed after the popover disappears
/// \param popoverPresentationController UIPopoverPresentationController
///
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController * _Nonnull)popoverPresentationController;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC19SwiftyPickerPopover22CountdownPickerPopover")
@interface CountdownPickerPopover : AbstractPopover
/// Initialize a Popover with the following argument.
/// \param title Title for navigation bar.
///
- (nonnull instancetype)initWithTitle:(NSString * _Nullable)title OBJC_DESIGNATED_INITIALIZER;
/// Set selected time interval
/// \param interval Value for picker.
///
///
/// returns:
/// self
- (nonnull instancetype)setSelectedTimeInterval:(NSTimeInterval)interval SWIFT_WARN_UNUSED_RESULT;
/// Set Done button properties.
/// \param title Title for the bar button item. Omissble. If it is nil or not specified, then localized “Done” will be used.
///
/// \param color Button tint color. Omissible. If this is nil or not specified, then the button tintColor inherits appear()’s baseViewController.view.tintColor.
///
/// \param action Action to be performed before the popover disappeared.
///
///
/// returns:
/// Self
- (nonnull instancetype)setDoneButtonWithTitle:(NSString * _Nullable)title color:(UIColor * _Nullable)color action:(void (^ _Nullable)(CountdownPickerPopover * _Nonnull, NSTimeInterval))action SWIFT_WARN_UNUSED_RESULT;
/// Set Cancel button properties.
/// \param title Title for the bar button item. Omissble. If it is nil or not specified, then localized “Cancel” will be used.
///
/// \param color Button tint color. Omissible. If this is nil or not specified, then the button tintColor inherits appear()’s baseViewController.view.tintColor.
///
/// \param action Action to be performed before the popover disappeared.
///
///
/// returns:
/// Self
- (nonnull instancetype)setCancelButtonWithTitle:(NSString * _Nullable)title color:(UIColor * _Nullable)color action:(void (^ _Nullable)(CountdownPickerPopover * _Nonnull, NSTimeInterval))action SWIFT_WARN_UNUSED_RESULT;
/// \param title Title for the button
///
/// \param color Button tint color. Omissible. If this is nil or not specified, then the button tintColor inherits appear()’s baseViewController.view.tintColor.
///
/// \param completion Action to be performed before the popover disappeared.
///
///
/// returns:
/// Self
- (nonnull instancetype)setClearButtonWithTitle:(NSString * _Nullable)title color:(UIColor * _Nullable)color action:(void (^ _Nullable)(CountdownPickerPopover * _Nonnull, NSTimeInterval))action SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


SWIFT_CLASS("_TtC19SwiftyPickerPopover36CountdownPickerPopoverViewController")
@interface CountdownPickerPopoverViewController : AbstractPickerPopoverViewController
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC19SwiftyPickerPopover17DatePickerPopover")
@interface DatePickerPopover : AbstractPopover
/// Initialize a Popover with the following argument.
/// \param title Title for navigation bar.
///
- (nonnull instancetype)initWithTitle:(NSString * _Nullable)title OBJC_DESIGNATED_INITIALIZER;
/// Set selected date
/// \param row The default value of picker.
///
///
/// returns:
/// self
- (nonnull instancetype)setSelectedDate:(NSDate * _Nonnull)date SWIFT_WARN_UNUSED_RESULT;
/// Set date mode of picker
/// \param dateMode UIDatePickerMode of picker.
///
///
/// returns:
/// self
- (nonnull instancetype)setDateMode:(UIDatePickerMode)dateMode SWIFT_WARN_UNUSED_RESULT;
/// Set minimum date
/// \param minimumDate Minimum value
///
///
/// returns:
/// self
- (nonnull instancetype)setMinimumDate:(NSDate * _Nonnull)minimumDate SWIFT_WARN_UNUSED_RESULT;
/// Set maximun date
/// \param minimumDate Minimum value
///
///
/// returns:
/// self
- (nonnull instancetype)setMaximumDate:(NSDate * _Nonnull)maximumDate SWIFT_WARN_UNUSED_RESULT;
/// Set minute interval
/// \param minimumDate Minimum value
///
///
/// returns:
/// self
- (nonnull instancetype)setMinuteInterval:(NSInteger)minuteInterval SWIFT_WARN_UNUSED_RESULT;
/// Set locale
/// \param localeIdentifier The locale identifier which is used for display date picker
///
///
/// returns:
/// Self
- (nonnull instancetype)setLocaleWithIdentifier:(NSString * _Nonnull)localeIdentifier SWIFT_WARN_UNUSED_RESULT;
/// Set locale
/// \param locale Locale which is used for display date picker
///
///
/// returns:
/// Self
- (nonnull instancetype)setLocale:(NSLocale * _Nonnull)locale SWIFT_WARN_UNUSED_RESULT;
/// Set Done button properties
/// \param title Title for the bar button item. Omissble. If it is nil or not specified, then localized “Done” will be used.
///
/// \param color Button tint color. Omissible. If this is nil or not specified, then the button tintColor inherits appear()’s baseViewController.view.tintColor.
///
/// \param action Action to be performed before the popover disappeared.
///
///
/// returns:
/// Self
- (nonnull instancetype)setDoneButtonWithTitle:(NSString * _Nullable)title color:(UIColor * _Nullable)color action:(void (^ _Nullable)(DatePickerPopover * _Nonnull, NSDate * _Nonnull))action SWIFT_WARN_UNUSED_RESULT;
/// Set Cancel button properties
/// \param title Title for the bar button item. Omissble. If it is nil or not specified, then localized “Cancel” will be used.
///
/// \param color Button tint color. Omissible. If this is nil or not specified, then the button tintColor inherits appear()’s baseViewController.view.tintColor.
///
/// \param action Action to be performed before the popover disappeared.
///
///
/// returns:
/// Self
- (nonnull instancetype)setCancelButtonWithTitle:(NSString * _Nullable)title color:(UIColor * _Nullable)color action:(void (^ _Nullable)(DatePickerPopover * _Nonnull, NSDate * _Nonnull))action SWIFT_WARN_UNUSED_RESULT;
/// Set Clear button properties
/// \param title Title for the button
///
/// \param color Button tint color. Omissible. If this is nil or not specified, then the button tintColor inherits appear()’s baseViewController.view.tintColor.
///
/// \param completion Action to be performed before the popover disappeared.
///
///
/// returns:
/// Self
- (nonnull instancetype)setClearButtonWithTitle:(NSString * _Nullable)title color:(UIColor * _Nullable)color action:(void (^ _Nullable)(DatePickerPopover * _Nonnull, NSDate * _Nonnull))action SWIFT_WARN_UNUSED_RESULT;
- (void)pickerView:(UIPickerView * _Nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class UIDatePicker;

SWIFT_CLASS("_TtC19SwiftyPickerPopover31DatePickerPopoverViewController")
@interface DatePickerPopoverViewController : AbstractPickerPopoverViewController
@property (nonatomic, weak) IBOutlet UIDatePicker * _Null_unspecified picker;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


/// StringPickerPopover has an UIPickerView that allows user to choose a String type choice.
SWIFT_CLASS("_TtC19SwiftyPickerPopover19StringPickerPopover")
@interface StringPickerPopover : AbstractPopover
/// Initialize a Popover with the following arguments.
/// \param title Title for navigation bar.
///
/// \param choices Options for picker.
///
- (nonnull instancetype)initWithTitle:(NSString * _Nullable)title choices:(NSArray<NSString *> * _Nonnull)choices OBJC_DESIGNATED_INITIALIZER;
/// Set selected row
/// \param row Selected row on picker
///
///
/// returns:
/// Self
- (nonnull instancetype)setSelectedRow:(NSInteger)row SWIFT_WARN_UNUSED_RESULT;
/// Set row height
/// \param height Row height
///
///
/// returns:
/// Self
- (nonnull instancetype)setRowHeight:(CGFloat)height SWIFT_WARN_UNUSED_RESULT;
/// Set displayStringFor closure
/// \param displayStringFor Rules for converting choice values to display strings.
///
///
/// returns:
/// Self
- (nonnull instancetype)setDisplayStringFor:(NSString * _Nullable (^ _Nullable)(NSString * _Nullable))displayStringFor SWIFT_WARN_UNUSED_RESULT;
/// Set done button properties
/// \param title Title for the bar button item. Omissble. If it is nil or not specified, then localized “Done” will be used.
///
/// \param color Button tint color. Omissible. If this is nil or not specified, then the button tintColor inherits appear()’s baseViewController.view.tintColor.
///
/// \param action Action to be performed before the popover disappeared. The popover, Selected row, Selected value. Omissble.
///
///
/// returns:
/// Self
- (nonnull instancetype)setDoneButtonWithTitle:(NSString * _Nullable)title color:(UIColor * _Nullable)color action:(void (^ _Nullable)(StringPickerPopover * _Nonnull, NSInteger, NSString * _Nonnull))action SWIFT_WARN_UNUSED_RESULT;
/// Set cancel button properties
/// \param title Title for the bar button item. Omissble. If it is nil or not specified, then localized “Cancel” will be used.
///
/// \param color Button tint color. Omissible. If this is nil or not specified, then the button tintColor inherits appear()’s baseViewController.view.tintColor.
///
/// \param action Action to be performed before the popover disappeared.The popover, Selected row, Selected value.
///
///
/// returns:
/// Self
- (nonnull instancetype)setCancelButtonWithTitle:(NSString * _Nullable)title color:(UIColor * _Nullable)color action:(void (^ _Nullable)(StringPickerPopover * _Nonnull, NSInteger, NSString * _Nonnull))action SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


@interface StringPickerPopover (SWIFT_EXTENSION(SwiftyPickerPopover)) <UIPickerViewDataSource>
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView * _Nonnull)pickerView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)pickerView:(UIPickerView * _Nonnull)pickerView numberOfRowsInComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
@end

@class NSAttributedString;

@interface StringPickerPopover (SWIFT_EXTENSION(SwiftyPickerPopover)) <UIPickerViewDelegate>
- (NSString * _Nullable)pickerView:(UIPickerView * _Nonnull)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
- (NSAttributedString * _Nullable)pickerView:(UIPickerView * _Nonnull)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)pickerView:(UIPickerView * _Nonnull)pickerView rowHeightForComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
- (void)pickerView:(UIPickerView * _Nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
@end


SWIFT_CLASS("_TtC19SwiftyPickerPopover33StringPickerPopoverViewController")
@interface StringPickerPopoverViewController : AbstractPickerPopoverViewController
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop