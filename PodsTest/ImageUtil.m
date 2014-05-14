//
//  ImageUtil.m
//  PodsTest
//
//  Created by 元場羊二郎 on 2014/05/14.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "ImageUtil.h"

@implementation ImageUtil

+ (UIImage *)createImageFromUIColor:(UIColor *)color {
	CGRect rect = CGRectMake(0, 0, 1, 1);
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(contextRef, [color CGColor]);
	CGContextFillRect(contextRef, rect);
	UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return img;
}
@end
