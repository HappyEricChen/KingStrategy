//
//  UIBarButtonItem+XMGExtension.h

//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JCExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
