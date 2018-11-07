//
//  UIImageView+Animation.h
//  KDControlKit
//
//  Created by naruto on 8/26/13.
//
//

#import <UIKit/UIKit.h>
/*检测点击间隔
 */
#define CheckClickInterval(sender,interval) \
do { \
    if(sender!=nil && sender.dateLastClick)\
    {\
        NSTimeInterval diff=[sender.dateLastClick timeIntervalSinceDate:[NSDate date]];\
        if(ABS(diff)<=interval)\
        {\
            return ;\
        }\
    }\
    sender.dateLastClick=[NSDate date];\
}\
while (0);

@interface UIView (Animation)
@property (nonatomic, assign) BOOL isAnimation;//是否在执行动画
@property (nonatomic, strong) NSDate *dateLastClick;//上次点击时间
@property (nonatomic, strong) id customTag;//数据

-(void)removeAssociatedObjects;
@end
