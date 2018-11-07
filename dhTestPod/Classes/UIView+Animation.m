//
//  UIImageView+Animation.m
//  KDControlKit
//
//  Created by naruto on 8/26/13.
//
//

#import "UIView+Animation.h"
#import <objc/runtime.h>
static const char *isAnimationKey = "isAnimationKey";
static const char *lastClickTimeKey = "lastClickTimeKey";
static const char *customTagKey = "customTagKey";

@implementation UIView (Animation)
@dynamic dateLastClick;
@dynamic isAnimation;
@dynamic customTag;

#pragma mark - isAnimation 是否在执行动画
- (BOOL)isAnimation
{
    return [objc_getAssociatedObject(self, isAnimationKey) boolValue];
}
- (void)setIsAnimation:(BOOL)newIsAnimation
{
    objc_setAssociatedObject(self, isAnimationKey,[NSNumber numberWithBool:newIsAnimation], OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - dateLastClick 上次点击 时间
- (NSDate *)dateLastClick
{
    return (NSDate *)objc_getAssociatedObject(self, lastClickTimeKey);
}

- (void)setDateLastClick:(NSDate *)newLastClickTime
{
    objc_setAssociatedObject(self, lastClickTimeKey, newLastClickTime, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - customTag 数据
- (id)customTag
{
    return objc_getAssociatedObject(self, customTagKey);
}
- (void)setCustomTag:(id)newCustomTag
{
    objc_setAssociatedObject(self, customTagKey,newCustomTag, OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - Associated
-(void)removeAssociatedObjects
{
    objc_removeAssociatedObjects(self);
}
@end
