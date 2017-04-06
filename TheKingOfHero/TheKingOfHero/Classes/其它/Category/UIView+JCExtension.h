//
//  UIView+XMGExtension.h

//

#import <UIKit/UIKit.h>

@interface UIView (JCExtension)
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
//- (CGFloat)x;
//- (void)setX:(CGFloat)x;
/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/


/** 判断一个控件是否在主窗口上 */
-(BOOL)isShowingOnKeyWindow;
/** 用Xib创建和本身名字一样的控件 */
+(instancetype)viewFromXib;

@end
