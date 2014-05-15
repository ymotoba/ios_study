//
//  UIView+Extention.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/15.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "UIView+Extention.h"

@implementation UIView (Extention)
- (CGFloat) top {
    return self.frame.origin.y;
}
- (void) setTop:(CGFloat) top {
    CGRect myRect = self.frame;
    myRect.origin.y = top;
    self.frame = myRect;
}
- (CGFloat) right {
    return self.frame.origin.x + self.frame.size.width;
}
- (void) setRight:(CGFloat)right {
    CGRect myRect = self.frame;
    myRect.origin.x = right - self.frame.size.width;
    self.frame = myRect;
}
- (CGFloat) bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void) setBottom:(CGFloat)bottom {
    CGRect myRect = self.frame;
    myRect.origin.y = bottom - self.frame.size.height;
    self.frame = myRect;
}
- (CGFloat) left {
    return self.frame.origin.x;
}
- (void) setLeft:(CGFloat)left {
    CGRect myRect = self.frame;
    myRect.origin.x =left;
    self.frame = myRect;
}
@end
